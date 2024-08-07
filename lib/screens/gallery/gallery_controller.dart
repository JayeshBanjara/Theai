import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GalleryController extends GetxController {
  late BuildContext context;

  String? selectedItem;
  final List<String> dropdownItems = ['Item 1', 'Item 2'];

  int categorySelected = 1;


  void navigateTo(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  void pop() {
    Navigator.of(context).pop(false);
    update();
  }

  void exitScreen() {
    Get.delete<GalleryController>();
    Navigator.pop(context);
  }
}
