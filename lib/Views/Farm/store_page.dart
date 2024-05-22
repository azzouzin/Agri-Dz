import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "المتجر",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            storeItem('Red Apple', '1k , Percieg', '2000 DA', '')
          ],
        ),
      )),
    );
  }

  Widget storeItem(
      String title, String descreption, String price, String image) {
    return SizedBox(
      width: 173.32,
      height: 248.51,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 173.32,
              height: 248.51,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 173.32,
                      height: 248.51,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFE2E2E2)),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Color(0x00000000),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 15,
                    top: 129.95,
                    child: SizedBox(
                      width: 137.02,
                      child: Text(
                        'Red Apple',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 16,
                          fontFamily: 'Gilroy-Bold',
                          fontWeight: FontWeight.w400,
                          height: 0.07,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 15,
                    top: 204.64,
                    child: SizedBox(
                      width: 52.13,
                      child: Text(
                        '\$4.99',
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 113.66,
                    top: 187.84,
                    child: Container(
                      width: 45.67,
                      height: 45.67,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 45.67,
                              height: 45.67,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF53B175),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 15,
                    top: 152.95,
                    child: SizedBox(
                      width: 72.27,
                      height: 14.89,
                      child: Text(
                        '1kg, Priceg',
                        style: TextStyle(
                          color: Color(0xFF7C7C7C),
                          fontSize: 14,
                          fontFamily: 'Gilroy-Medium',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 22.14,
            top: 33.70,
            child: Container(
              width: 103.43,
              height: 62.56,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/103x63"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
