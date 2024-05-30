// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../main.dart';
import 'constants.dart';

class SectionChat extends StatefulWidget {
  const SectionChat({super.key});

  @override
  State<SectionChat> createState() => _SectionChatState();
}

class _SectionChatState extends State<SectionChat> {
  final controller = TextEditingController();

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool set) => setState(() => _loading = set);
  final List<Content> chats = [];
  // Initialize the chat
  List<Conversation> conversations = [];
  @override
  Widget build(BuildContext context) {
    var chat = model!.startChat();
    return Scaffold(
      appBar: AppBar(
        title: Text("المساعد الذكي"),
      ),
      body: Column(
        children: [
          Expanded(
              child: chats.isNotEmpty
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        reverse: true,
                        child: ListView.builder(
                          itemBuilder: chatItem,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: conversations.length,
                          reverse: false,
                        ),
                      ),
                    )
                  : const Center(child: Text('ابدا الاستشارة'))),
          if (loading) const CircularProgressIndicator(),
          ChatInputBox(
            controller: controller,
            onSend: () async {
              if (controller.text.isNotEmpty) {
                loading = true;

                var content = Content.text(controller.text);
                chats.add(
                  Content.text(controller.text),
                );
                conversations
                    .add(Conversation(role: 'user', messege: controller.text));
                controller.clear();

                var response = await chat.sendMessage(content);
                print(response.text);
                chats.add(Content.model([TextPart(response.text!)]));

                conversations
                    .add(Conversation(role: 'model', messege: response.text!));

                loading = false;
              }
            },
          ),
        ],
      ),
    );
  }

  Widget chatItem(BuildContext context, int index) {
    //  final Content content = chats[index];
    final Conversation content = conversations[index];

    return Card(
      elevation: 0,
      color:
          content.role == 'model' ? Colors.blue.shade800 : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content.role != 'model' ? 'انت' : 'الذكاء الاصطناعي',
            ),
            Markdown(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                data: content.messege ?? 'cannot generate data!'),
          ],
        ),
      ),
    );
  }
}

class Conversation {
  String role;
  String messege;
  Conversation({
    required this.role,
    required this.messege,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'messege': messege,
    };
  }

  factory Conversation.fromMap(Map<String, dynamic> map) {
    return Conversation(
      role: map['role'] as String,
      messege: map['messege'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Conversation.fromJson(String source) =>
      Conversation.fromMap(json.decode(source) as Map<String, dynamic>);
}
