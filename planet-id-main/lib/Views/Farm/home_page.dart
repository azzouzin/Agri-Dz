import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantid/Controller/controller.dart';
import 'package:plantid/Views/Compenants/constants.dart';
import 'package:plantid/Views/Farm/farming_page.dart';
import 'package:plantid/Views/Farm/store_page.dart';
import 'package:plantid/Views/Farm/study_page.dart';

import '../Weather/homePage.dart';
import 'tomato_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text(apptitle, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: Container(),
        actions: [
          Image.asset("assets/logo.png", scale: 5),
        ],
      ),
      body: GetBuilder<Controller>(builder: (controller) {
        return controller.index == 0
            ? const FarmingPage()
            : controller.index == 2
                ? const StorePage()
                : controller.index == 3
                    ? HomePage()
                    : const StudyPage();
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
            controller.changeindex(value);
          },
          elevation: 10,
          unselectedItemColor: Colors.grey,
          selectedItemColor: green,
          backgroundColor: const Color.fromARGB(255, 216, 218, 216),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.agriculture_outlined,
                ),
                label: 'مزارع'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'دراسة'),
            BottomNavigationBarItem(
                icon: Icon(Icons.store_outlined), label: 'متجر'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.sunny,
                ),
                label: 'المناخ'),
          ]),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await getImage();
          Get.to(const TomatoExample());
        },
        shape: const CircleBorder(),
        tooltip: 'Increment',
        backgroundColor: green,
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
  }
}
