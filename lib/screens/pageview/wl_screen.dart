import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:theia/screens/pageview/pageview_controller.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';

class WlScreen extends StatefulWidget {
  const WlScreen({super.key});

  @override
  State<WlScreen> createState() => _WlScreenState();
}

class _WlScreenState extends State<WlScreen> {
  final wlController = Get.put(PageViewController());

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
                  Semantics(
                    label: 'theia welcome',
                    child: Container(
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
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      LocaleKeys.wellDone.tr,
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
                      LocaleKeys.olt.tr,
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
                      LocaleKeys.wlDescription.tr,
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
