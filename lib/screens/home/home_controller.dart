import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  late BuildContext context;

  TextEditingController searchController = TextEditingController();


  void navigateTo(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  void pop() {
    Navigator.of(context).pop(false);
    update();
  }

  void exitScreen() {
    Get.delete<HomeController>();
    Navigator.pop(context);
  }
}
