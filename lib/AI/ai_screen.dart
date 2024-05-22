import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http; // importing glassmorphism package
import 'package:glassmorphism/glassmorphism.dart';
import '../Views/Compenants/loading.dart';
import 'dises.dart';
import 'reults_companents.dart';

class AiPage extends StatefulWidget {
  const AiPage({super.key});

  @override
  State<AiPage> createState() => _AiPageState();
}

Dises? disesID;

class _AiPageState extends State<AiPage> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = currentDirection == TextDirection.rtl;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                header(width, height, isRTL, context),
                //Expanded(child: Container()),
                disesID == null ? Container() : ResultsWidget(),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isloading = true;
                    });
                    await pickAndSendMultipleImages();
                    setState(() {
                      isloading = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "التقط صور",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.camera,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ]),
            ),
            isloading == true
                ? const Loading(
                    caption: "Loading",
                  )
                : Container()
          ],
        );
      }),
    );
  }

  Stack header(double width, double height, bool isRTL, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height * 0.22,
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: const GlassContainer(
            // start: 0.6,
            // end: 0.4,
            child: Center(
              child: Text(
                "التقط صورة و سيتم تحليلها بالذكاء الاصطناعي و عرض النتائج \nلنتائج اكثر دقة التقط عدة صور ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
//          alignment: Alignment.centerLeft,
          left: 0,
          bottom: 0,
          child: Container(
            //color: Colors.amber,
            // width: width,
            height: height * 0.12,
            //    padding: EdgeInsets.all(10),
          ),
        ),
        /*   Positioned(
//          alignment: Alignment.centerLeft,
          left: 90,
          bottom: 0,
          child: Container(
            //color: Colors.amber,
            // width: width,
            height: height * 0.08,
            //    padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/images/home/tree.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
//          alignment: Alignment.centerLeft,
          left: 150,
          bottom: 0,
          child: Container(
            //color: Colors.amber,
            // width: width,
            height: height * 0.04,
            //    padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/images/home/tree.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
       */ /* Padding(
          padding: EdgeInsets.only(top: 5.0, left: 15, right: 15, bottom: 10),
          child: Container(
            width: width,
            height: 189,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                if (!isRTL)
                  Positioned(
                      top: 40,
                      left: 20,
                      right: 50,
                      child: Text(
                        getTranslated(context, "Welcome"),
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                else
                  Positioned(
                      top: 35,
                      right: 20,
                      left: 50,
                      child: Text(
                        getTranslated(context, "Welcome"),
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                if (!isRTL)
                  Positioned(
                      top: 65,
                      left: 20,
                      child: Text(
                        getTranslated(context, "subtitle1") +
                            getTranslated(context, "subtitle2"),
                        style: TextStyle(
                            fontSize: 10.75,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                else
                  Positioned(
                      top: 60,
                      right: 20,
                      child: Text(
                        getTranslated(context, "subtitle1") +
                            getTranslated(context, "subtitle2"),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                if (!isRTL)
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Text(
                        getTranslated(context, "subtitle3") +
                            getTranslated(context, "subtitle4"),
                        style: const TextStyle(
                            fontSize: 10.75,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                else
                  Positioned(
                      top: 100,
                      right: 20,
                      child: Text(
                        getTranslated(context, "subtitle3") +
                            getTranslated(context, "subtitle4"),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                if (!isRTL)
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                          height: 190,
                          width: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/splash/leafgreenr.png"),
                              fit: BoxFit.cover,

                              // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.color)
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          )))
                else
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          height: 190,
                          width: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/splash/leafgreenfer.png"),
                              fit: BoxFit.cover,

                              // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.color)
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ))),
              ],
            ),
          ),
        ),
      */
      ],
    );
  }

  Future<void> pickAndSendMultipleImages() async {
    // Pick multiple images
    final List<XFile?> pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages.isEmpty) return;

    //
    List imagesBase64 = [];
    // Loop through each image
    for (final imageFile in pickedImages) {
      if (imageFile == null) continue;

      // Read the image bytes
      final bytes = await imageFile.readAsBytes();

      // Convert the image bytes to Base64 string
      final base64Image = base64Encode(bytes);
      imagesBase64.add(base64Image);
    }
    // Send the Base64 string to your API
    try {
      final response = await http.post(
          Uri.parse(
              'https://plant.id/api/v3/health_assessment?language=ar&details=local_name,description,url,treatment,classification,common_names,cause'), //

          headers: {
            'Api-Key': 'KZdTZ2SAU3Wt9zr5UpYmQ7lLBuUtqKPobhKzGW69pfJ2PXQdzw',
            'Content-Type': 'application/json'
          },
          body: json.encode(
            {
              "images": imagesBase64,
              "latitude": 35.914357,
              "longitude": 4.915019,
              "similar_images": true
            },
          ));

      // Handle successful response
      print('Image uploaded successfully!');
      print(response.body);
      disesID = Dises.fromJson(json.decode(response.body));
      Logger().i(disesID!.result!.isHealthy!.probability);
    } catch (error) {
      // Handle errors
      print('Error sending image: ${error}');
      Logger().e(error);
    }
  }
}
