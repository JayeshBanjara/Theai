import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theia/lang/locale_keys.g.dart';
import 'package:theia/screens/ar_item/ar_item_screen.dart';
import 'package:theia/screens/check_in/check_in_screen.dart';
import 'package:theia/utils/extensions.dart';

import '../../utils/global.dart';
import 'arview_controller.dart';

class ArViewScreen extends StatefulWidget {
  const ArViewScreen({super.key});

  @override
  State<ArViewScreen> createState() => _ArViewScreenState();
}

class _ArViewScreenState extends State<ArViewScreen> {
  final arViewController = Get.put(ArViewController());
  String language = '';
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    Get.delete<ArViewController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<ArViewController>(
        init: ArViewController(),
        builder: (cont) {
          return Scaffold(
            key: _key,
            body: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.transparent, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.5, 1], // Adjust the stops so the gradient stops at 1 (no color at the bottom)
                    ),
                  ),
                  child: Semantics(
                    label: 'theia',
                    child: Image.asset(
                      ImageConstants.imgSample4,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Column(
                  children: [
                    45.heightBox,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,15,15,0),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Semantics(
                                label: 'back button ar view screen',
                                child: SvgPicture.asset(
                                  ImageConstants.icBack,
                                  height: 26,
                                  width: 26,
                                ),
                              )),
                          Expanded(
                            child: Text(
                              'Albert Hall Museum',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          /*InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(ImageConstants.icFav2))*/
                        ],
                      ),
                    ),
                    Text(
                      'AR View',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily2,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    /*Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: SvgPicture.asset(ImageConstants.icDot),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: const BoxDecoration(
                              color: AppColors.lightGreyColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.white, Colors.white70])),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  ImageConstants.imgSample4,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              10.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sculpture',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppConstants.fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: AppColors.lightDarkColor,
                                    ),
                                  ),
                                  Text(
                                    '110 BC',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppConstants.fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColors.lightDarkColor,
                                    ),
                                  ),
                                  5.heightBox,
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration:
                                          const Duration(milliseconds: 200),
                                          reverseDuration:
                                          const Duration(milliseconds: 200),
                                          child: const ArItemScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        '360° view',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppConstants.fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppColors.lightDarkColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),*/
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.scale,
                          dialogType: DialogType.noHeader,
                          body: Center(child: Column(
                            children: [
                              Text(
                                'Theai',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              const SizedBox(height: 15,),
                              Semantics(
                                label: 'You are twenty meter away from museum',
                                child: Text(
                                  'You are 20m away from museum.',
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.lightDarkColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                            ],
                          ),),
                          btnOkText: LocaleKeys.scanAccess.tr,
                          btnOkColor: AppColors.darkPurpleColor,
                          btnOk: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration:
                                  const Duration(milliseconds: 200),
                                  reverseDuration:
                                  const Duration(milliseconds: 200),
                                  child: const CheckInScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                              const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  5.widthBox,
                                  Text(
                                    LocaleKeys.scanAccess.tr,
                                    style: TextStyle(
                                      fontFamily: AppConstants.fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.lightGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ).show();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColors.lightGreyColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Start exploring',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    80.heightBox
                  ],
                ),
              ],
            ),
          );
        });
  }
}
