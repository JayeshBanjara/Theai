import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theia/screens/pageview/pageview_controller.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> with SingleTickerProviderStateMixin{

  final themeController = Get.put(PageViewController());

  String language = '';

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  void dispose() {
    Get.delete<PageViewController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<PageViewController>(
        init: PageViewController(),
        builder: (cont) {
          return Scaffold(
            body: Container(
              color: AppColors.greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    label: 'theme image',
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2.2,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                          )
                      ),
                      child: CircularRevealAnimation(
                          animation: animation,
                          centerOffset: const Offset(205, 200),
                          minRadius: 10,
                          maxRadius: 400,
                          child: Image.asset(ImageConstants.imgTheme,fit: BoxFit.fill)),
                    ),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      LocaleKeys.chooseTheme.tr,
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),

                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            themeController.themeValue = 1;
                            themeController.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: themeController.themeValue == 1
                                ?AppColors.blackColor:AppColors.greyColor,
                                border: Border.all(color: AppColors.blackColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              LocaleKeys.highContrast.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: themeController.themeValue == 1
                                    ?Colors.white:AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        10.widthBox,
                        InkWell(
                          onTap: (){
                            themeController.themeValue = 2;
                            themeController.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: themeController.themeValue == 2
                                    ?AppColors.blackColor:AppColors.greyColor,
                                border: Border.all(color: AppColors.blackColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              LocaleKeys.blackWhite.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: themeController.themeValue == 2
                                    ?Colors.white:AppColors.blackColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  5.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            themeController.themeValue = 3;
                            themeController.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: themeController.themeValue == 3
                                    ?AppColors.blackColor:AppColors.greyColor,
                                border: Border.all(color: AppColors.blackColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              LocaleKeys.light.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: themeController.themeValue == 3
                                    ?Colors.white:AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        10.widthBox,
                        InkWell(
                          onTap: (){
                            themeController.themeValue = 4;
                            themeController.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: themeController.themeValue == 4
                                    ?AppColors.blackColor:AppColors.greyColor,
                                border: Border.all(color: AppColors.blackColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              LocaleKeys.dark.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: themeController.themeValue == 4
                                    ?Colors.white:AppColors.blackColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Expanded(child: Container()),

                ],
              ),
            ),
          );
        });
  }
}
