import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantid/Views/Compenants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AskExperts extends StatefulWidget {
  const AskExperts({super.key});

  @override
  State<AskExperts> createState() => _WorkWithUsState();
}

class _WorkWithUsState extends State<AskExperts> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File? imageFile;
  File? groundimageFile;
  TextEditingController name = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController mochkila = TextEditingController();
  TextEditingController tafasil = TextEditingController();
  TextEditingController dust = TextEditingController();
  TextEditingController water = TextEditingController();

  String gender = "male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: title('استشاري', Iconsax.activity),
              ),
              textField(
                'الاسم و اللقب',
                name,
                Icons.person,
              ),
              verticalpadding,
              textField('رقم الهاتف', birthdate, Icons.phone),
              verticalpadding,
              textField('نوع الاستشارة', mochkila, Icons.info),
              SizedBox(
                width: Get.width,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("مشكلة معينة"),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("دراسة منطقة"),
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                            print(gender);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              verticalpadding,
              textField('تفاصيل المشكلة', tafasil, Icons.email),
              verticalpadding,

              textField('مكونات التربة ان امكن', dust, Icons.donut_small),
              verticalpadding,

              textField('تركيبة الماء ان امكن', water, Icons.water),
              verticalpadding,

              InkWell(
                onTap: () {
                  setState(() {
                    _openImagePicker(groundimageFile);
                  });
                  setState(() {});
                },
                child: Container(
                  width: 500 * 0.9,
                  height: Get.height * 0.15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 5))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(imageFile == null
                        ? ' اظغط هنا لتحميل صورة لارضك'
                        : 'تم تحميل الصورة'),
                  ),
                ),
              ),
              verticalpadding,

              verticalpadding,
              InkWell(
                onTap: () {
                  setState(() {
                    _openImagePicker(imageFile);
                  });
                  setState(() {});
                },
                child: Container(
                  width: 500 * 0.9,
                  height: Get.height * 0.15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 5))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(groundimageFile == null
                        ? 'اظغط هنا لتحميل صورة '
                        : 'تم تحميل الصورة'),
                  ),
                ),
              ),
              verticalpadding,

              InkWell(
                onTap: () {
                  setState(() {
                    openMaps(context: context);
                  });
                  setState(() {});
                },
                child: Container(
                  width: 500 * 0.9,
                  height: Get.height * 0.15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 5))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("قم بتحديد الموقع"),
                        horizontalpadding,
                        Image.asset(
                          "assets/maps.png",
                          scale: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              verticalpadding,

              //   Expanded(child: SizedBox()),
/*
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      fixedSize: Size(500 * 0.9, Get.height * 0.075),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    /* Get.snackbar(
                  'تم إرسال طلبك بنجاح ',
                  'سنقوم برد عليك في أقرب  وقت',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.greenAccent.withOpacity(0.5),
                );*/
                  },
                  child: const Text(
                    'إرسال',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  )),
              verticalpadding,
*/
              FlutterSocialButton(
                onTap: () {
                  openWhatsapp(
                      context: context,
                      number: phone,
                      text: name.text +
                          mochkila.text +
                          tafasil.text +
                          water.text +
                          dust.text);
                  Get.back();
                },
                buttonType: ButtonType.whatsapp,
                title: "ارسال",
              ),
              const SizedBox(
                height: 2,
              ),
              //For google Button
              FlutterSocialButton(
                onTap: () {
                  openEmail(
                      context: context,
                      number: phone,
                      text: name.text +
                          mochkila.text +
                          tafasil.text +
                          water.text +
                          dust.text);
                  Get.back();
                },
                buttonType: ButtonType.email,
                title: "ارسال",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openImagePicker(File? file) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      file = File(pickedImage.path);
      // Do something with the image file
    }
  }

  Row title(String t, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          t,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: green),
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          iconData,
          color: green,
        ),
      ],
    );
  }

  Padding textField(
      String tit, TextEditingController editingController, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          title(tit, iconData),
          Container(
            width: 500 * 0.9,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(0, 5))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2,
                    color: green,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void openWhatsapp(
      {required BuildContext context,
      required String text,
      required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  void openEmail(
      {required BuildContext context,
      required String text,
      required String number}) async {
    String email = Uri.encodeComponent("Hadil6.zeroual@gmail.com");
    String subject = Uri.encodeComponent("استشارة");
    String body = Uri.encodeComponent("$text");
    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (await canLaunch(mail.toString())) {
      await launch(mail.toString());
    } else {
      print('Could not launch $mail');
    }
  }

  void openMaps({
    required BuildContext context,
  }) async {
    var url = "https://www.google.com/maps";

    // android , web
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Maps not installed")));
    }
  }
}
