
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';
import 'check_in_controller.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final checkInController = Get.put(CheckInController());
  String language = '';

  @override
  void dispose() {
    Get.delete<CheckInController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<CheckInController>(
      init: CheckInController(),
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
                SvgPicture.asset(ImageConstants.icQr),
                20.heightBox,
                Text(
                  LocaleKeys.scanAcces.tr,
                  style: TextStyle(
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                Text(
                  LocaleKeys.pointExplore.tr,
                  style: TextStyle(
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                20.heightBox,
                Text(
                  LocaleKeys.checkInDes.tr,
                  style: TextStyle(
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.greenColor,
                  ),
                ),
                20.heightBox,

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MobileScanner(
                        fit: BoxFit.fill,
                          onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        for (final barcode in barcodes) {
                          print(barcode.rawValue ?? "No Data found in QR");
                        }
                      }),
                    ),
                  ),
                ),
                50.heightBox,
              ],
            ),
          ),
        );
      },
    );
  }
}

