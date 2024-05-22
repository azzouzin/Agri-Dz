import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({
    super.key,
    required this.text,
    required this.function,
    required this.iconData,
  });
  final String text;
  final Function function;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: Get.width * 0.25,
        //height: Get.height * 0.,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: green,
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(255, 173, 255, 207),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(
                iconData,
                size: 40,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
