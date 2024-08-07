import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';
import 'pageview_controller.dart';

class SoundPreferenceScreen extends StatefulWidget {
  const SoundPreferenceScreen({super.key});

  @override
  State<SoundPreferenceScreen> createState() => _SoundPreferenceScreenState();
}

class _SoundPreferenceScreenState extends State<SoundPreferenceScreen> {
  final soundController = Get.put(PageViewController());

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
                    child: SvgPicture.asset(ImageConstants.icChat),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      LocaleKeys.voiceAssistantPreferences.tr,
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
                        soundController.sPreferenceValue = 1;
                        soundController.update();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: soundController.sPreferenceValue == 1
                                ?AppColors.blackColor:AppColors.greyColor,
                            border: Border.all(color: AppColors.blackColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          LocaleKeys.lowSpeechRate.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: soundController.sPreferenceValue == 1
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
                        soundController.sPreferenceValue = 2;
                        soundController.update();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: soundController.sPreferenceValue == 2
                                ?AppColors.blackColor:AppColors.greyColor,
                            border: Border.all(color: AppColors.blackColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          LocaleKeys.highSpeechRate.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: soundController.sPreferenceValue == 2
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
                        soundController.sPreferenceValue = 3;
                        soundController.update();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: soundController.sPreferenceValue == 3
                                ?AppColors.blackColor:AppColors.greyColor,
                            border: Border.all(color: AppColors.blackColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          LocaleKeys.disable.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: soundController.sPreferenceValue == 3
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
