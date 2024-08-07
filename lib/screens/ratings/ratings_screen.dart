import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:theia/screens/ratings/ratings_controller.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  final ratingController = Get.put(RatingsController());
  String language = '';

  @override
  void dispose() {
    Get.delete<RatingsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<RatingsController>(
        init: RatingsController(),
        builder: (cont) {
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColors.blackColor,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.heightBox,
                  Text(
                    LocaleKeys.howWasYrVisit.tr,
                    style: TextStyle(
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  10.heightBox,

                  Row(
                    children: [
                      SvgPicture.asset(ImageConstants.selectedStar),
                      15.widthBox,
                      SvgPicture.asset(ImageConstants.selectedStar),
                      15.widthBox,
                      SvgPicture.asset(ImageConstants.selectedStar),
                      15.widthBox,
                      SvgPicture.asset(ImageConstants.selectedStar),
                      15.widthBox,
                      SvgPicture.asset(ImageConstants.unselectedStar),
                    ],
                  ),
                  30.heightBox,

                  Text(
                    LocaleKeys.shareYrExpAbt.tr,
                    style: TextStyle(
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  10.heightBox,

                  Row(
                    children: [
                      SvgPicture.asset(ImageConstants.selectedStar),
                      15.widthBox,
                      SvgPicture.asset(ImageConstants.selectedStar),
                      15.widthBox,
                      SvgPicture.asset(ImageConstants.selectedStar),
                      15.widthBox,
                      SvgPicture.asset(ImageConstants.selectedStar),
                      15.widthBox,
                      SvgPicture.asset(ImageConstants.unselectedStar),
                    ],
                  ),
                  20.heightBox,

                  TextFormField(
                    style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor
                    ),
                    maxLines: 3,
                    controller: ratingController.questionController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                        const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        hintText: LocaleKeys.writeSmthToUs.tr,
                        hintStyle:  TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:  BorderSide.none)
                    ),
                  ),
                ],
              ),
            )
          );
        });
  }
}
