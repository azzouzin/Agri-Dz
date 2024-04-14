import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantid/Views/Compenants/constants.dart';
import 'package:plantid/Views/Farm/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
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
                    Text(
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
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  minimumSize: Size(Get.width * 0.8, Get.height * 0.07)),
              onPressed: () {
                Get.to(MyHomePage());
              },
              child: Text(
                "ابدا",
                style: TextStyle(color: Colors.white),
              )),
          verticalpadding
        ],
      ),
    );
  }
}
