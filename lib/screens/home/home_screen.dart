import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theia/lang/locale_keys.g.dart';
import 'package:theia/screens/arview/arview_screen.dart';
import 'package:theia/screens/museum/museum_screen.dart';
import 'package:theia/screens/navigation/navigation_screen.dart';
import 'package:theia/screens/support/support_screen.dart';
import 'package:theia/utils/extensions.dart';
import 'package:theia/utils/global.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  late PersistentBottomSheetController? _controller;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool _open = false;
  String language = '';

  void _toggleBottomSheet() {
    if (!_open) {
      _open = true;
      _controller = _key.currentState?.showBottomSheet(
        enableDrag: false,
        (_) => _bottomSheetView(homeController),
      );
      Future.delayed(const Duration(seconds: 3), () {
        if (_open) {
          _open = false;
          _controller?.close();
        }
      });
    }
    homeController.update();
  }

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  // Check location permission status
  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permission denied");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permissions are permanently denied");
      return;
    }

    _getCurrentLocation();
  }


  // Get the current location
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (cont) {
          return Scaffold(
            key: _key,
            body: Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 15, right: 15),
              width: double.maxFinite,
              color: AppColors.greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  45.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              duration: const Duration(milliseconds: 300),
                              reverseDuration:
                                  const Duration(milliseconds: 300),
                              child: const NavigationScreen(),
                            ),
                          );
                        },
                        child: Semantics(
                          label: 'menu',
                          child: SvgPicture.asset(
                            ImageConstants.icMenu,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            _toggleBottomSheet();
                            homeController.update();
                          },
                          child: Semantics(
                            label: 'theia',
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 12),
                              decoration: BoxDecoration(
                                color: AppColors.blackColor2,
                                borderRadius: BorderRadius.circular(27)
                              ),
                                child: SvgPicture.asset(ImageConstants.icVc,height: 18,width: 18,)),
                          ))
                    ],
                  ),
                  30.heightBox,
                  SvgPicture.asset(ImageConstants.icExploreTxt),
                  40.heightBox,
                  TextFormField(
                    controller: homeController.searchController,
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: AppColors.lightGreyColor,
                        errorMaxLines: 2,
                        hintText: LocaleKeys.searchNearby.tr,
                        hintStyle: TextStyle(
                          color: AppColors.lightDarkColor,
                          fontSize: 14,
                          fontFamily: AppConstants.fontFamily2,
                          fontWeight: FontWeight.w300,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.loose(const Size.square(36)),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset(ImageConstants.icSearch),
                        )),
                  ),
                  20.heightBox,
                  Expanded(
                    child: ListView.separated(
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 15),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 200),
                                reverseDuration:
                                    const Duration(milliseconds: 200),
                                child: const MuseumScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.heightBox,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 42),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Semantics(
                                          label: 'theia home page image',
                                          child: SizedBox(
                                            height: 72,
                                            child: Image.asset(
                                              ImageConstants.imgBuilding,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      5.widthBox,
                                      Expanded(
                                        child: Semantics(
                                          label: 'theia home page image',
                                          child: SizedBox(
                                            height: 72,
                                            child: Image.asset(
                                              ImageConstants.imgBuilding,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      5.widthBox,
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.rightToLeft,
                                                duration: const Duration(milliseconds: 200),
                                                reverseDuration: const Duration(milliseconds: 200),
                                                child: const ArViewScreen(),
                                              ),
                                            );
                                          },
                                          child: Semantics(
                                            label: 'theia home page image',
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ClipRect(
                                                  child: Stack(
                                                    children: [
                                                      SizedBox(
                                                        height: 72,
                                                        child: Image.asset(
                                                          ImageConstants.imgBuilding,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                        child: BackdropFilter(
                                                          filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                                                          child: Container(
                                                            color: Colors.transparent,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      ImageConstants.icRotate,
                                                      color: AppColors.lightBlackColor,
                                                    ),
                                                    Text(
                                                      index == 1 ? '360 view' : 'AR view',
                                                      style: TextStyle(
                                                        fontFamily: AppConstants.fontFamily2,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                        color: AppColors.darkWhiteColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                2.heightBox,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 42),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Albert Hall Museum',
                                            style: TextStyle(
                                              fontFamily:
                                                  AppConstants.fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: AppColors.lightDarkColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Jaipur',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppConstants.fontFamily2,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 18,
                                                  color:
                                                      AppColors.lightDarkColor,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Container(
                                                  color: AppColors.blackColor2,
                                                  height: 18,
                                                  width: 1,
                                                ),
                                              ),
                                              Text(
                                                '2334 km',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppConstants.fontFamily2,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 18,
                                                  color:
                                                      AppColors.lightDarkColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (index == 1)
                                        Semantics(
                                          label: 'theia home page',
                                          child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: AppColors.lightGreyColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: SvgPicture.asset(
                                                  ImageConstants.icDir)),
                                        ),
                                    ],
                                  ),
                                ),
                                25.heightBox,
                                Row(
                                  children: [
                                    Semantics(
                                        label: 'button location',
                                        child: SvgPicture.asset(ImageConstants.icSend)),
                                    10.widthBox,
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.rightToLeft,
                                            duration: const Duration(milliseconds: 200),
                                            reverseDuration: const Duration(milliseconds: 200),
                                            child: const SupportScreen(),
                                          ),
                                        );
                                      },
                                      child: Semantics(
                                        label: 'button call',
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 30),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: AppColors.blackColor
                                          ),
                                          child: SvgPicture.asset(ImageConstants.icCall,height: 18,width: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                10.heightBox,
                               /* InkWell(
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
                                        const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                        color: AppColors.blackColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(ImageConstants.icQr),
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
                                )*/
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 15.heightBox;
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

_bottomSheetView(HomeController homeController) {
  return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (contet) {
        return Container(
          padding: const EdgeInsets.all(15),
          color: AppColors.blackColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.userVoiceAssistant.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: AppConstants.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              15.widthBox,
              Lottie.asset(ImageConstants.voiceAnimation,
                  width: 50, height: 32),
            ],
          ),
        );
      });
}