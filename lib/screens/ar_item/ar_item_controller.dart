import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ArItemController extends GetxController {
  late BuildContext context;


  void navigateTo(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  void pop() {
    Navigator.of(context).pop(false);
    update();
  }

  void exitScreen() {
    Get.delete<ArItemController>();
    Navigator.pop(context);
  }
}
