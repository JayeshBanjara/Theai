import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theia/lang/locale_keys.g.dart';
import 'package:theia/screens/home/home_screen.dart';
import 'package:theia/screens/welcome2_screen/welcome2_controller.dart';
import 'package:theia/utils/extensions.dart';
import 'package:theia/utils/global.dart';

class Welcome2Screen extends StatefulWidget {
  const Welcome2Screen({super.key});

  @override
  State<Welcome2Screen> createState() => _Welcome2ScreenState();
}

class _Welcome2ScreenState extends State<Welcome2Screen> {
  final wl2Controller = Get.put(Welcome2Controller());

  String language = '';

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: const Duration(milliseconds: 200),
            reverseDuration: const Duration(milliseconds: 200),
            child: const HomeScreen(),
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<Welcome2Controller>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<Welcome2Controller>(
        init: Welcome2Controller(),
        builder: (cont) {
          return Scaffold(
            body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: AppColors.greyColor,
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height / 1.1,
                    decoration: const BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                        Lottie.asset(ImageConstants.voiceAnimation),
                        60.heightBox,
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              LocaleKeys.wlToTheia.tr,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              LocaleKeys.findExplore.tr,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        30.heightBox
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
