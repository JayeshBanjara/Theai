import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SupportController extends GetxController {
  late BuildContext context;


  TextEditingController questionController = TextEditingController();

  void navigateTo(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  void pop() {
    Navigator.of(context).pop(false);
    update();
  }

  void exitScreen() {
    Get.delete<SupportController>();
    Navigator.pop(context);
  }
}
