import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'blurry_container.dart';

class Loading extends StatelessWidget {
  final String? caption;
  const Loading({Key? key, this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlurryContainer(
      width: width,
      height: height,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitDoubleBounce(
            color: Colors.green,
            size: 50.0,
          ),
          SizedBox(height: 20),
          Text(this.caption!,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
