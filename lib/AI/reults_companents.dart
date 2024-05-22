import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:plant_icons/plant_icons.dart';
import 'package:plantid/AI/dises.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Views/Compenants/card_text.dart';
import 'ai_screen.dart';

class ResultsWidget extends StatelessWidget {
  ResultsWidget({
    super.key,
  });
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...disesID!.result!.disease!.suggestions!
            .map((e) => desiseDetails(context, e))
            .toList(),
      ],
    );
  }

  Container desiseDetails(BuildContext context, Suggestions suggestions) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 129, 228, 93).withOpacity(0.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          myDivider(" المرض"),
          /*  suggestions.details!.url == null
              ? Container()
              : ElevatedButton(
                  onPressed: () {
                    Logger().w(suggestions.details!.url);
                    final Uri emailLaunchUri = Uri(
                      scheme: 'https',
                      path: suggestions.details!.url,
                    );
                    launchUrl(emailLaunchUri);
                  },
                  child: Text("تفاصيل")),*/
          /*   Text(suggestions.details!.treatment!
            .biological!.first!),
        Text(suggestions.details!.treatment!
            .prevention!.first!),
       */
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardText(
                  descreption: suggestions.name!,
                  titel: suggestions.details!.localName ?? "",
                  icondata: PlantIcons.plant,
                ),
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 3.0,
                  animation: true,
                  percent: suggestions.probability!,
                  center: new Text(
                    (suggestions.probability! * 100).toString() + "%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.green,
                ),
              ],
            ),
          ),
          myDivider("اقتراحات"),
          suggestions.details!.treatment!.biological == null
              ? Container()
              : CardText(
                  descreption:
                      suggestions.details!.treatment!.biological!.first,
                  titel: "العلاج",
                  icondata: PlantIcons.plant,
                ),
          suggestions.details!.treatment!.prevention == null
              ? Container()
              : CardText(
                  descreption:
                      suggestions.details!.treatment!.prevention!.first,
                  titel: "الوقاية",
                  icondata: PlantIcons.plant,
                ),
          SizedBox(height: 5),
          /*  CardText(
            descreption: suggestions.details!.cause.toString(),
            titel: "العلاج",
            icondata: PlantIcons.plant,
          ),*/
          myDivider("صور مماثلة للمرض"),
          SizedBox(height: 15),
          /*      
          SizedBox(
            height: 100,
            width: Get.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: disesID!
                    .result!.disease!.suggestions!.first.similarImages!.length,
                itemBuilder: (context, index) {
                  return Image.network(disesID!.result!.disease!.suggestions!
                      .first.similarImages![index].url!);
                })),
        */

          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: suggestions!.similarImages!
                .map((item) => InkWell(
                      onTap: () {
                        showmyimage(context, item.url.toString());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                        width: Get.width,
                        height: Get.height * 0.15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: Image.network(
                            item.url!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  Padding myDivider(title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showmyimage(BuildContext context, String path) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: Get.height * 0.7,
              width: Get.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Colors.black.withOpacity(0.15)),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: Colors.white),
              child: Stack(
                children: [
                  /* Image.network(
                      path,
                      height: height * 0.7,
                      width: width,
                      fit: BoxFit.cover,
                    ),*/
                  Container(
                    //height: height * 0.7,
                    //width: width,
                    child: PhotoView(
                      imageProvider: NetworkImage(path),
                      // customSize: Size(width * 0.9, height * 0.7),
                      enableRotation: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.clear,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
