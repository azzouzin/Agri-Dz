// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_icons/plant_icons.dart';

class CardText extends StatelessWidget {
  const CardText({
    Key? key,
    required this.titel,
    required this.descreption,
    required this.icondata,
  }) : super(key: key);
  final String titel;
  final String descreption;
  final IconData icondata;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      // height: Get.height * 0.05,
      //color: Colors.amber,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xff0ACF83)),
            child: Icon(
              icondata,
              color: Color(0xff014738),
              size: 20,
            ),
          ),
          //  SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titel,
                style: TextStyle(),
              ),
              titel == 'التقرير'
                  ? SizedBox(
                      width: Get.width * 0.6,
                      child: Text(
                        descreption,
                        style: TextStyle(),
                      ),
                    )
                  : SizedBox(
                      width: Get.width * 0.2,
                      child: Text(
                        descreption,
                        style: TextStyle(),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
