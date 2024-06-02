import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantid/Views/Compenants/constants.dart';
import 'package:plantid/Views/Farm/home_page.dart';

import '../../Models/firestore_db.dart';
import '../Compenants/custom_snack_bar.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  FireStorDB fireStore = FireStorDB();
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 10,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset("assets/logo.png"),
                    verticalpadding,
                    const Text(
                      apptitle,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: codeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'ادخل رمز التحقق',
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  minimumSize: Size(Get.width * 0.8, Get.height * 0.07)),
              onPressed: () async {
                final resp = await fireStore.getSpecificDocument(
                    "codes", codeController.text);
                print(resp);
                if (resp != null) {
                  if (resp['status'] == "active") {
                    Get.to(const MyHomePage());
                  } else {
                    CustomSnackBar.showCustomErrorSnackBar(
                        title: 'الكود منتهي الصلاحية',
                        message: 'ادخل كود فعال',
                        duration: const Duration(seconds: 3));
                  }
                } else {
                  CustomSnackBar.showCustomErrorSnackBar(
                      title: 'الكود خاطئ',
                      message: 'ادخل كود صحيح',
                      duration: const Duration(seconds: 3));
                }
              },
              child: const Text(
                "ابدا",
                style: TextStyle(color: Colors.white),
              )),
          verticalpadding
        ],
      ),
    );
  }
}
