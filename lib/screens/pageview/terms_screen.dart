import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:theia/screens/pageview/pageview_controller.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  final termsController = Get.put(PageViewController());

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
                    label: 'theia terms and coditions image',
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
                      LocaleKeys.termsCondition.tr,
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
                    child:  RichText(
                        text: TextSpan(
                          text: 'The use of the Theia is subject to the acceptance of the ',
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.blackColor,
                          ), // Default text style
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Use.',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                                fontFamily: AppConstants.fontFamily,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                                text: ' By continuing you’re accepting terms and conditions.',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: AppColors.blackColor,
                                )
                            ),
                          ],
                        )),
                  ),

                  40.heightBox,
                ],
              ),
            ),
          );
        });
  }
}
