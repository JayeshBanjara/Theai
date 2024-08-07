import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theia/screens/support/support_controller.dart';
import 'package:theia/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final supportController = Get.put(SupportController());

  String language = '';
  final String phoneNumber = '1234567890';

  void _launchDialPad() async {
    final String url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    Get.delete<SupportController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<SupportController>(
        init: SupportController(),
        builder: (cont) {
          return Scaffold(
              body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.blackColor,
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              60.heightBox,
              Text(
                LocaleKeys.weAreHereTo.tr,
                style: TextStyle(
                  fontFamily: AppConstants.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              RichText(
                  text: TextSpan(
                text: LocaleKeys.help.tr,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkYellowColor,
                  fontFamily: AppConstants.fontFamily,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: LocaleKeys.you.tr,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: AppConstants.fontFamily,
                    ),
                  ),
                ],
              )),
              20.heightBox,
              Text(
                LocaleKeys.feelFreeToCall.tr,
                style: TextStyle(
                  fontFamily: AppConstants.fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              20.heightBox,
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    decoration: BoxDecoration(
                        color: AppColors.blueColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.heightBox,
                            Text(
                              LocaleKeys.available.tr,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily2,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.greyColor2,
                              ),
                            ),
                            3.heightBox,
                            Text(
                              LocaleKeys.museumReception.tr,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily2,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '10 ${LocaleKeys.minWaitTime.tr}',
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily2,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.greyColor2,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _launchDialPad();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  LocaleKeys.call.tr,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -35,
                    right: -22,
                    child: SvgPicture.asset(
                      ImageConstants.shape1,
                    ),
                  ),
                ],
              ),
              25.heightBox,
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    decoration: BoxDecoration(
                        color: AppColors.purpleColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.heightBox,
                            Text(
                              LocaleKeys.available.tr,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily2,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.greyColor2,
                              ),
                            ),
                            3.heightBox,
                            Text(
                              LocaleKeys.technicalSupport.tr,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily2,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '3 ${LocaleKeys.minWaitTime.tr}',
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily2,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.greyColor2,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                LocaleKeys.reachUs.tr,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.blueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -35,
                    right: -22,
                    child: SvgPicture.asset(
                      ImageConstants.shape1,
                    ),
                  ),
                ],
              ),
            ]),
          ));
        });
  }
}
