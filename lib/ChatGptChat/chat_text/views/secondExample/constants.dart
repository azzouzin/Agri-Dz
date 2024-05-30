import 'package:flutter/material.dart';

final heroCard = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(.12),
          offset: const Offset(0, 27),
          blurRadius: 27,
          spreadRadius: .5)
    ]);

final heroNav = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(50.0),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withOpacity(.23),
          offset: const Offset(2, 18),
          blurRadius: 18,
          spreadRadius: .5)
    ]);

const kToken = "";

class ChatInputBox extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSend, onClickCamera;

  const ChatInputBox({
    super.key,
    this.controller,
    this.onSend,
    this.onClickCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (onClickCamera != null)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                  onPressed: onClickCamera,
                  color: Theme.of(context).colorScheme.onSecondary,
                  icon: const Icon(Icons.file_copy_rounded)),
            ),
          Expanded(
              child: TextField(
            controller: controller,
            minLines: 1,
            maxLines: 6,
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              hintText: 'Message',
              border: InputBorder.none,
            ),
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
          )),
          Padding(
            padding: const EdgeInsets.all(4),
            child: FloatingActionButton.small(
              onPressed: onSend,
              child: const Icon(Icons.send_rounded),
            ),
          )
        ],
      ),
    );
  }
}