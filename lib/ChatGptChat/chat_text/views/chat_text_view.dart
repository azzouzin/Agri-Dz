import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/chat_text_controller.dart';
import 'headers.dart';
import 'search_text_field_widget.dart';
import 'widgets/text_card.dart';

class ChatTextView extends GetView<ChatTextController> {
  ChatTextView({Key? key}) : super(key: key);

  ChatTextController controller = Get.put(ChatTextController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.8),
        title: const Text('Chat GPT Text'),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: controller.messages.length,
              itemBuilder: (BuildContext context, int index) {
                final textData = controller.messages[index];
                return textData.index == -999999
                    ? MyTextCard(textData: textData)
                    : TextCard(textData: textData);
              },
            ),
          ),
          controller.state.value == ApiState.loading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox(),
          const SizedBox(height: 12),
          SearchTextFieldWidget(
              color: Colors.green.withOpacity(0.8),
              textEditingController: controller.searchTextController,
              onTap: () {
                controller
                    .getTextCompletion(controller.searchTextController.text);
              }),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
