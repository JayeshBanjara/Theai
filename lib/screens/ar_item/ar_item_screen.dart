import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';
import 'ar_item_controller.dart';

class ArItemScreen extends StatefulWidget {
  const ArItemScreen({super.key});

  @override
  State<ArItemScreen> createState() => _ArItemScreenState();
}

class _ArItemScreenState extends State<ArItemScreen> {
  final arItemController = Get.put(ArItemController());

  String language = '';
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    Get.delete<ArItemController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<ArItemController>(
        init: ArItemController(),
        builder: (cont) {
          return Scaffold(
            key: _key,
            body: Stack(
              children: [
                Semantics(
                  label: 'theia ar item banner',
                  child: Image.asset(ImageConstants.imgArItem,
                      width: double.maxFinite,
                      height: double.maxFinite,
                      fit: BoxFit.fill),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    45.heightBox,
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Semantics(
                                label: 'back button ar item',
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
                    ),
                    20.heightBox,
                    Expanded(child: Container()),
                    Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.8,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                  gradient: LinearGradient(
                                      colors: [Colors.white, Colors.white70])),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dioskouroi',
                                      style: TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    Text(
                                      'Year : 211-170 BC',
                                      style: TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    10.heightBox,
                                    Text(
                                      'The mythical twin heroes, Kastor (Κάστωρ, beaver; Latin, Castor) and Polydeukes (Πολυδεύκης, much sweet wine; Latin, Polydeuces or Pollux) were known as the Dioskouroi (Greek ).Their mother was Leda, but they had different fathers; Castor was the mortal son of Tyndareus, the king of Sparta, while Pollux was the divine son of Zeus, who seduced Leda in the guise of a swan.The mythical twin heroes, Kastor (Κάστωρ, beaver; Latin, Castor) and Polydeukes (Πολυδεύκης, much sweet wine; Latin, Polydeuces or Pollux) were known as the Dioskouroi (Greek ).Their mother was Leda, but they had different fathers; Castor was the mortal son of Tyndareus, the king of Sparta, while Pollux was the divine son of Zeus, who seduced Leda in the guise of a swan.',
                                      style: TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    15.heightBox
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 20,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                LocaleKeys.direction.tr,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              10.widthBox,
                              SvgPicture.asset(ImageConstants.icDir)
                            ]),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}