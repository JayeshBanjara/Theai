import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/global.dart';
import '../../utils/my_shared_preferences.dart';
import '../home/home_screen.dart';

class PageViewController extends GetxController {
  late BuildContext context;
  final pageController = PageController();

  int themeValue = 1;
  int avoidValue = 1;
  int preferenceValue = 1;
  int sPreferenceValue = 1;




  void changePage(int index) {
    //  pageController.jumpToPage(index);
    if(pageController.hasClients){
      print('Index...$index');
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }

  }

  Future<void> onClicked() async {
    MySharedPreferences.instance
        .addBoolToSF(SharedPreferencesKeys.isOnBodingClicked, true);
  }


  void navigateTo(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  void pop() {
    Navigator.of(context).pop(false);
    update();
  }

  void exitScreen() {
    Get.delete<PageViewController>();
    Navigator.pop(context);
  }
}
