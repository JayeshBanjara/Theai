import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';
import 'pageview_controller.dart';

class VisualPreferenceScreen extends StatefulWidget {
  const VisualPreferenceScreen({super.key});

  @override
  State<VisualPreferenceScreen> createState() => _VisualPreferenceScreenState();
}

class _VisualPreferenceScreenState extends State<VisualPreferenceScreen> {
  final preferenceController = Get.put(PageViewController());

  String language = '';

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
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: AppColors.greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  50.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SvgPicture.asset(ImageConstants.icEye),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      LocaleKeys.visualPreferences.tr,
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),

                  30.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: InkWell(
                      onTap: (){
                        preferenceController.preferenceValue = 1;
                        preferenceController.update();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: preferenceController.preferenceValue == 1
                                ?AppColors.blackColor:AppColors.greyColor,
                            border: Border.all(color: AppColors.blackColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          LocaleKeys.mapping.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: preferenceController.preferenceValue == 1
                                ?Colors.white:AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  5.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: InkWell(
                      onTap: (){
                        preferenceController.preferenceValue = 2;
                        preferenceController.update();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: preferenceController.preferenceValue == 2
                                ?AppColors.blackColor:AppColors.greyColor,
                            border: Border.all(color: AppColors.blackColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          LocaleKeys.standardOrientation.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: preferenceController.preferenceValue == 2
                                ?Colors.white:AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  5.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: InkWell(
                      onTap: (){
                        preferenceController.preferenceValue = 3;
                        preferenceController.update();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: preferenceController.preferenceValue == 3
                                ?AppColors.blackColor:AppColors.greyColor,
                            border: Border.all(color: AppColors.blackColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          LocaleKeys.degreeOrientation.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: preferenceController.preferenceValue == 3
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
