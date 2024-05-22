import 'package:flutter/material.dart';

class TomatoExample extends StatefulWidget {
  const TomatoExample({super.key});

  @override
  State<TomatoExample> createState() => _TomatoExampleState();
}

class _TomatoExampleState extends State<TomatoExample> {
  List<String> tomatoPhotos = [
    'assets/tm1.jpg',
    'assets/tm2.jpg',
    'assets/tm3.jpg',
    'assets/tm4.jpg',
    'assets/tm5.jpg',
    'assets/tm6.jpg',
    'assets/tm7.jpg',
    'assets/tm8.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ...tomatoPhotos
                .map((e) => Image.asset(
                      e,
                      fit: BoxFit.fitWidth,
                    ))
                .toList(),
          ],
        ),
      )),
    );
  }
}
