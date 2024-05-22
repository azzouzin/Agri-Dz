import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:flutter/material.dart';
import 'package:plantid/ChatGptChat/completion_page.dart';

import '../keys.dart';
import 'chat_completion_page.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('Chat completion')),
                Tab(icon: Text('Completion')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ChatCompletionPage(chatGpt: chatGpt),
              CompletionPage(chatGpt: chatGpt),
            ],
          ),
        ),
      ),
    );
  }
}
