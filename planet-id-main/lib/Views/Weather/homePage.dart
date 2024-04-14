import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantid/Views/Compenants/constants.dart';
import 'package:plantid/Views/Farm/call_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dataset.dart';
import 'detailPage.dart';
import 'extraWeather.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: SingleChildScrollView(
        child: Column(
          children: [CurrentWeather(), TodayWeather()],
        ),
      ),
    );
  }
}

class CurrentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2 - 25,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
      decoration: BoxDecoration(
        //   glowColor: Color(0xff00A1FF).withOpacity(0.5),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: Color(0xff00A1FF).withOpacity(0.1),
        //spreadRadius: 5,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: green),
              onPressed: () async {
                Get.to(AskExperts());
              },
              child: Text(
                "اتصل بالاستشاري حالا ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            verticalpadding,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: green),
              onPressed: () async {
                openWethear(context: context);
              },
              child: Text(
                " حالة الطقس في موقعك الحالي",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(


                      
                      " " + currentTemp.location!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Image(
              image: AssetImage(currentTemp.image!),
              fit: BoxFit.fill,
            ),
            Text(
              currentTemp.current.toString(),
              style: const TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(currentTemp.name!,
                style: const TextStyle(fontSize: 25, color: Colors.white)),
            Text(currentTemp.day!,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            ExtraWeather(currentTemp)
          ],
        ),
      ),
    );
  }

  void openWethear({
    required BuildContext context,
  }) async {
    var whatsappURlAndroid = "https://openweathermap.org/";
    var whatsappURLIos = "https://openweathermap.org/";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("هناك مشكلة حاول لاحقا")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("هناك مشكلة حاول لاحقا")));
      }
    }
  }
}

class TodayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "اليوم",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DetailPage();
                    }));
                  },
                  child: const Row(
                    children: [
                      Text(
                        "7 ايام ",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                        size: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 30,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherWidget(todayWeather[0]),
                      SizedBox(width: 10),
                      WeatherWidget(todayWeather[1]),
                      SizedBox(width: 10),
                      WeatherWidget(todayWeather[2]),
                      SizedBox(width: 10),
                      WeatherWidget(todayWeather[3])
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  WeatherWidget(this.weather);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          Text(
            weather.current.toString() + "\u00B0",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage(weather.image!),
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            weather.time!,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
