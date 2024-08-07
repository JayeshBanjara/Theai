import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';
import 'pageview_controller.dart';

class AvoidScreen extends StatefulWidget {
  const AvoidScreen({super.key});

  @override
  State<AvoidScreen> createState() => _AvoidScreenState();
}

class _AvoidScreenState extends State<AvoidScreen> with SingleTickerProviderStateMixin{
  final avoidController = Get.put(PageViewController());

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
                    label: 'theia navigation preferences',
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
                          child: Image.asset(ImageConstants.imgAvoid,fit: BoxFit.fill)),
                    ),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      LocaleKeys.navigationPreferences.tr,
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
                            avoidController.avoidValue = 1;
                            avoidController.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: avoidController.avoidValue == 1
                                    ?AppColors.blackColor:AppColors.greyColor,
                                border: Border.all(color: AppColors.blackColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              LocaleKeys.stairs.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: avoidController.avoidValue == 1
                                    ?Colors.white:AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        5.widthBox,
                        InkWell(
                          onTap: (){
                            avoidController.avoidValue = 2;
                            avoidController.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: avoidController.avoidValue == 2
                                    ?AppColors.blackColor:AppColors.greyColor,
                                border: Border.all(color: AppColors.blackColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              LocaleKeys.elevators.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: avoidController.avoidValue == 2
                                    ?Colors.white:AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        5.widthBox,
                        InkWell(
                          onTap: (){
                            avoidController.avoidValue = 3;
                            avoidController.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: avoidController.avoidValue == 3
                                    ?AppColors.blackColor:AppColors.greyColor,
                                border: Border.all(color: AppColors.blackColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              LocaleKeys.escalators.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: avoidController.avoidValue == 3
                                    ?Colors.white:AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  5.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: InkWell(
                      onTap: (){
                        avoidController.avoidValue = 4;
                        avoidController.update();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: avoidController.avoidValue == 4
                                ?AppColors.blackColor:AppColors.greyColor,
                            border: Border.all(color: AppColors.blackColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          LocaleKeys.crampedSpaces.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: avoidController.avoidValue == 4
                                ?Colors.white:AppColors.blackColor,
                          ),
                        ),
                      ),
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
