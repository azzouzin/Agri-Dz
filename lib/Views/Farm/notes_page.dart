
import 'package:flutter/material.dart';
import '../Compenants/constants.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

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
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "المذكرة اليومية",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            verticalpadding,
            noteItem(
              const Color(0xFFF6DEE2),
              const Color(0xFFCD3954),
            ),
            verticalpadding,
            noteItem(
              const Color(0xFFEFE9F7),
              const Color(0xFF6A3EA1),
            ),
            verticalpadding,
            noteItem(
              const Color(0xFFDAF6E4),
              const Color(0xFF60D889),
            )
          ],
        ),
      )),
    );
  }

  Container noteItem(
    Color bgColor,
    Color stripColor,
  ) {
    return Container(
      //  width: Get.width * 0.9,
      //height: 252,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 224,
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
              color: bgColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '💡 New Product Idea Design',
                  style: TextStyle(
                    color: Color(0xFF180E25),
                    fontSize: 16,
                    // fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    //    height: 0.09,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  //height: 140,
                  child: Opacity(
                    opacity: 0.60,
                    child: Text(
                      'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement. \n\nThere will be a choice to select what kind of notes that user needed, so the experience while taking notes can be unique based on the needs.',
                      style: TextStyle(
                        color: Color(0xFF180E25),
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              color: stripColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'Interesting Idea',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
