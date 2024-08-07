import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theia/screens/user_guide/user_guide_controller.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';

class UserGuideScreen extends StatefulWidget {
  const UserGuideScreen({super.key});

  @override
  State<UserGuideScreen> createState() => _UserGuideScreenState();
}

class _UserGuideScreenState extends State<UserGuideScreen> {
  final userGuideController = Get.put(UserGuideController());
  String language = '';
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    Get.delete<UserGuideController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<UserGuideController>(
        init: UserGuideController(),
        builder: (cont) {
          return Scaffold(
            key: _key,
            body: Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 15, right: 15),
              width: double.maxFinite,
              height: double.maxFinite,
              color: AppColors.greyColor,
              child: Column(
                children: [
                  45.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Semantics(
                            label: 'theia',
                            child: SvgPicture.asset(
                              ImageConstants.icBack,
                              height: 26,
                              width: 26,
                            ),
                          )),
                      /*InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(ImageConstants.icFav,
                              height: 40, width: 40))*/
                    ],
                  ),
                  20.heightBox,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.userGuide.tr,
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: AppColors.darkPurpleColor,
                            ),
                          ),
                          Text(
                            LocaleKeys.exploreHowToUse.tr,
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: AppColors.lightDarkColor,
                            ),
                          ),

                          /*Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.darkYellowColor
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        20.widthBox,
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor
                                          ),
                                          child: Text(
                                            LocaleKeys.itemDetails.tr,
                                            style: TextStyle(
                                              fontFamily: AppConstants.fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        10.widthBox,
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor
                                          ),
                                          child: Text(
                                            LocaleKeys.bluePrint.tr,
                                            style: TextStyle(
                                              fontFamily: AppConstants.fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: -1,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                    ),
                                    color: AppColors.greyColor,
                                  ),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(ImageConstants.icExplore),
                                      2.heightBox,

                                      Text(
                                        LocaleKeys.explore.tr,
                                        style: TextStyle(
                                          fontFamily: AppConstants.fontFamily,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: AppColors.blackColor,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),*/
                          20.heightBox,
                          Stack(
                            children: [
                              SvgPicture.asset(
                                ImageConstants.yellowShape,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  10.heightBox,
                                  Row(
                                    children: [
                                      30.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.itemDetails.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      7.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.bluePrint.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  7.heightBox,
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            7, 6, 15, 6),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.talkback.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      7.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.directions.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  7.heightBox,
                                  Row(
                                    children: [
                                      30.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.arView.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      7.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.voiceAssistant.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      30.widthBox,
                                      Text(
                                        LocaleKeys.features.tr,
                                        style: TextStyle(
                                          fontFamily: AppConstants.fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 5,
                                top: 15,
                                child: Column(
                                  children: [
                                    SvgPicture.asset(ImageConstants.icExplore),
                                    2.heightBox,
                                    Text(
                                      LocaleKeys.explore.tr,
                                      style: TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Stack(
                            children: [
                              SvgPicture.asset(
                                ImageConstants.blueShape,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  40.heightBox,
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            7, 6, 15, 6),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.callReception.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      7.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.whereISExit.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  7.heightBox,
                                  Row(
                                    children: [
                                      30.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.hiTheia.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      7.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.whatCanISee.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  7.heightBox,
                                  Row(
                                    children: [
                                      30.widthBox,
                                      Text(
                                        LocaleKeys.commands.tr,
                                        style: TextStyle(
                                          fontFamily: AppConstants.fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 5,
                                top: 15,
                                child: Column(
                                  children: [
                                    SvgPicture.asset(ImageConstants.icExplore),
                                    2.heightBox,
                                    Text(
                                      LocaleKeys.explore.tr,
                                      style: TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Stack(
                            children: [
                              SvgPicture.asset(
                                ImageConstants.purpleShape,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  40.heightBox,
                                  Row(
                                    children: [
                                      20.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.theiaLite.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  7.heightBox,
                                  Row(
                                    children: [
                                      40.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.vrGlasses.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      7.widthBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.lightYellowColor),
                                        child: Text(
                                          LocaleKeys.theiaPro.tr,
                                          style: TextStyle(
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  7.heightBox,
                                  Row(
                                    children: [
                                      30.widthBox,
                                      Text(
                                        LocaleKeys.comingSoon.tr,
                                        style: TextStyle(
                                          fontFamily: AppConstants.fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 5,
                                top: 15,
                                child: Column(
                                  children: [
                                    SvgPicture.asset(ImageConstants.icExplore),
                                    2.heightBox,
                                    Text(
                                      LocaleKeys.explore.tr,
                                      style: TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
