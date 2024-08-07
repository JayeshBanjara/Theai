import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:theia/utils/extensions.dart';

import '../../../lang/locale_keys.g.dart';
import '../../../utils/global.dart';
import '../pageview_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final welcomeController = Get.put(PageViewController());

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
              color: AppColors.greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2.2,
                    decoration: const BoxDecoration(
                        color: AppColors.blackColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      )
                    ),
                    child: Align(
                            alignment: Alignment.center,
                            child: Lottie.asset(ImageConstants.voiceAnimation)),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      LocaleKeys.hello.tr,
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      LocaleKeys.imTheia.tr,
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      LocaleKeys.welcomeDescription.tr,
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  40.heightBox,
                ],
              ),
            ),
          );
        });
  }
}
