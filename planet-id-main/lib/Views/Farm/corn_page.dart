import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Compenants/constants.dart';

class CornExample extends StatefulWidget {
  const CornExample({super.key});

  @override
  State<CornExample> createState() => _CornExampleState();
}

class _CornExampleState extends State<CornExample> {
  List<String> tomatoPhotos = [
    'assets/dr1.jpg',
    'assets/dr2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text(apptitle, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Image.asset("assets/logo.png", scale: 5),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ...tomatoPhotos
                .map((e) => Image.asset(
                      e,
                      fit: BoxFit.fitWidth,
                    ))
                .toList(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
              // ignore: prefer_const_constructors
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "التسميد",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
              child: Text(
                "احتياجات الطماطم بالنسبة للعناصر المعدنية  (NPK ) حيث ان مردود 90 طن /هكتار يحتاج الى 250 وحدة ازوتية , 70 وحدة فوسفاتية , 430 وحدة من البوتاس و75 وحدة مغنيزيوم خلال الموسم .",
                textAlign: TextAlign.end,
              ),
            ),
            verticalpadding,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
              // ignore: prefer_const_constructors
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "موعد حصاد الطماطم ",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
              child: Text(
                "\n لون الطماطم يجب أن يكون لون الطماطم متساويًا ومشرقًا. الطماطم الناضجة عادة تكون بلون أكثر غمقًا ملمس القشرة  يجب أن تكون قشرة الطماطم ناعمة ولكن لا تكون متساقطة بسهولة.\n الحجم الطماطم الناضجة غالباً ما تكون أثقل بالمقارنة مع الطماطم الخام.\n الرائحة: يمكن أن تكون الطماطم الناضجة لها رائحة طيبة ومميزة.\n التفاوت في اللون: تفاوت لون الطماطم يمكن أن يشير إلى نضجها.\n يفضل أن يتم فحص الطماطم بشكل دوري وتجنب انتظار نضج جميع الثمار في نفس اللحظة، حيث قد تكون هناك اختلافات في نضجها.\n",
                textAlign: TextAlign.end,
              ),
            ),
            verticalpadding,
            verticalpadding,
          ],
        ),
      )),
    );
  }
}
