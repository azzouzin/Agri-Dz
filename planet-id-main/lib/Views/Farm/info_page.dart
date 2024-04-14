import 'package:flutter/material.dart';

import '../Compenants/constants.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          verticalpadding,
          verticalpadding,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                scale: 4,
              ),
              SizedBox(width: 15),
              Text(
                "Agri DZ تطبيق",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "انشأ هذا التطبيق  لمتابعة المحاصيل الزراعية ليخدم كل فلاح او باحث في مجال الفلاحة والزراعة ليوفر له قاعدة ضخمة من المعلومات وطرق زراعية وحل مشكلات في المجال بتقنيات ذكية وذلك  باستخدام الذكاء الاصطناعي . كما يوفر استشارات وتحليلات بعدة  طرق علمية يتم الاستخدام  من بينها  نظم  المعلومات الجغرافية  SiG في التحليلات    وذلك بالتواصل المباشر من زر الاستشارات هذا التطبيق يسمح بممارسة الزراعة بشكل ذكي وسهل انشأ من طرف الانسة زروال هديل ماستر في الجغرافيا والتهيئة الريفية",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          )
        ],
      )),
    );
  }
}
