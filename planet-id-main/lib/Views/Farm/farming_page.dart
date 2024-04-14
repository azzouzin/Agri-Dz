import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantid/Views/Farm/call_page.dart';
import 'package:plantid/Views/Farm/notes_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Compenants/constants.dart';
import '../Compenants/my_button.dart';
import 'corn_page.dart';
import 'tomato_page.dart';

class FarmingPage extends StatefulWidget {
  const FarmingPage({super.key});

  @override
  State<FarmingPage> createState() => _FarmingPageState();
}

class _FarmingPageState extends State<FarmingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          verticalpadding,
          const Text(
            "تطبيق مزرعتي يهتم بكل ما يخص المزارعين مقولى بالذكاء الاصطناعي لاكتشاف مختلف الامراض و حالة المحاصيل",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          verticalpadding,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...crops
                    .map((e) => corpsItem(e, imgsOfCorps[crops.indexOf(e)]))
                    .toList(),
              ],
            ),
          ),
          verticalpadding,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  Get.to(AskExperts());
                  //  openWhatsapp(context: context, number: phone, text: "TEXT");
                },
                child: Container(
                  width: Get.width * 0.4,
                  height: Get.height * 0.15,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: Get.width * 0.4,
                        height: Get.height * 0.15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/expert.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        "استشاري المحاصيل",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.to(NotesPage()),
                child: Container(
                  width: Get.width * 0.4,
                  height: Get.height * 0.15,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: Get.width * 0.4,
                        height: Get.height * 0.15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/note.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        "المذكرة اليومية",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalpadding,
          Column(
            children: [
              const Text(
                "معرفة حالة محصولك من مواعيد تسميد و حصاد",
                style: TextStyle(fontSize: 18),
              ),
              verticalpadding,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Mybutton(
                    text: "نتيجة",
                    function: () {},
                    iconData: Icons.done_all_outlined,
                  ),
                  Mybutton(
                    text: "معالجة",
                    function: () {},
                    iconData: Icons.qr_code,
                  ),
                  Mybutton(
                    text: "التقط صورة",
                    function: () async {
                      await getImage();
                      Get.to(CornExample());
                    },
                    iconData: Icons.camera_alt_outlined,
                  ),
                ],
              ),
            ],
          ),
          verticalpadding,
          Column(
            children: [
              const Text(
                "معرفة حالة محصولك و علاجه بظغطة واحدة",
                style: TextStyle(fontSize: 18),
              ),
              verticalpadding,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Mybutton(
                    text: "احصل على العلاج",
                    function: () {},
                    iconData: Icons.done_all_outlined,
                  ),
                  Mybutton(
                    text: "استكشف التشخيص",
                    function: () {},
                    iconData: Icons.qr_code,
                  ),
                  Mybutton(
                    text: "التقط صورة",
                    function: () async {
                      await getImage();
                      Get.to(TomatoExample());
                    },
                    iconData: Icons.camera_alt_outlined,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Column corpsItem(String e, String image) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: Get.width * 0.15,
          height: Get.width * 0.15,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 2)
              ],
              shape: BoxShape.circle,
              border: Border.all(width: 0.5, color: Colors.black)),
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          e,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
  }
}
