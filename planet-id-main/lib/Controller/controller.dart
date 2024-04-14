import 'package:get/get.dart';

class Controller extends GetxController {
  int index = 0;

  changeindex(int i) {
    index = i;
    update();
  }
}
