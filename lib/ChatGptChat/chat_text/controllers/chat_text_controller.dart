import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Models/text_completion_model.dart';
import '../views/headers.dart';

class ChatTextController extends GetxController {
  //TODO: Implement ChatTextController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<TextCompletionData> messages = [];

  var state = ApiState.notFound.obs;

  void test(String query) async {
    try {
      print(query);
      final encodedParams = json.encode({
        "email": "+213674756915",
        "password": 123456789,
      });

      final response = await http.post(
        Uri.parse(
          "https://dev.amwalflow.com/api/v1/app/auth/login",
        ),
        body: encodedParams,
        headers: headerBearerOption(OPEN_AI_KEY),
      );
      print("Response  body     ${response.body}");
      if (response.statusCode == 200) {
        // messages =
        //     TextCompletionModel.fromJson(json.decode(response.body)).choices;
        //
        addServerMessage(
            TextCompletionModel.fromJson(json.decode(response.body)).choices);
        state.value = ApiState.success;
      } else {
        // throw ServerException(message: "Image Generation Server Exception");
        state.value = ApiState.error;
      }
    } catch (e) {
      print(e);
    } finally {
      // searchTextController.clear();
      update();
    }
  }

  getTextCompletion(String query) async {
    addMyMessage();

    state.value = ApiState.loading;

    try {
      Map<String, String> rowParams = {
        "model": "gpt-3.5-turbo-16k",
        "prompt": query,
      };
      print(query);
      final encodedParams = json.encode(rowParams);

      final response = await http.post(
        Uri.parse(endPoint("completions")),
        body: encodedParams,
        headers: headerBearerOption(OPEN_AI_KEY),
      );
      print("Response  body     ${response.body}");
      if (response.statusCode == 200) {
        // messages =
        //     TextCompletionModel.fromJson(json.decode(response.body)).choices;
        //
        addServerMessage(
            TextCompletionModel.fromJson(json.decode(response.body)).choices);
        state.value = ApiState.success;
      } else {
        // throw ServerException(message: "Image Generation Server Exception");
        state.value = ApiState.error;
      }
    } catch (e) {
      print(e);
    } finally {
      // searchTextController.clear();
      update();
    }
  }

  addServerMessage(List<TextCompletionData> choices) {
    for (int i = 0; i < choices.length; i++) {
      messages.insert(i, choices[i]);
    }
  }

  addMyMessage() {
    // {"text":":\n\nWell, there are a few things that you can do to increase","index":0,"logprobs":null,"finish_reason":"length"}
    TextCompletionData text = TextCompletionData(
        text: searchTextController.text, index: -999999, finish_reason: "");
    messages.insert(0, text);
  }

  TextEditingController searchTextController = TextEditingController();
}
