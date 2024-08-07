import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LanguagePageController extends GetxController {
  late BuildContext context;


  void navigateTo(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  void pop() {
    Navigator.of(context).pop(false);
    update();
  }

  void exitScreen() {
    Get.delete<LanguagePageController>();
    Navigator.pop(context);
  }
}
