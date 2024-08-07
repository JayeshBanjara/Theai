import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  late BuildContext context;

  bool isOnBodingClicked = false;


  void navigateTo(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  void pop() {
    Navigator.of(context).pop(false);
    update();
  }

  void exitScreen() {
    Get.delete<SplashController>();
    Navigator.pop(context);
  }
}
