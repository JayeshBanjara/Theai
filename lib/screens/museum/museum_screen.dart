import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rich_readmore/rich_readmore.dart';
import 'package:theia/screens/support/support_screen.dart';
import 'package:theia/utils/extensions.dart';
import '../../utils/global.dart';
import '../arview/arview_screen.dart';
import '../gallery/gallery_screen.dart';
import '../item/item_screen.dart';
import 'museum_controller.dart';

class MuseumScreen extends StatefulWidget {
  const MuseumScreen({super.key});

  @override
  State<MuseumScreen> createState() => _MuseumScreenState();
}

class _MuseumScreenState extends State<MuseumScreen> {
  final museumController = Get.put(MuseumController());
  String language = '';

  final TextSpan textSpan = TextSpan(
    text:
        'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
    style: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: AppConstants.fontFamily),
  );
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    Get.delete<MuseumController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<MuseumController>(
        init: MuseumController(),
        builder: (cont) {
          return Scaffold(
            key: _key,
            floatingActionButton:SpeedDial(
              gradientBoxShape: BoxShape.circle,
              icon: Icons.add,
              iconTheme: const IconThemeData(color: Colors.white),
              activeIcon: Icons.close,
              backgroundColor: Colors.black,
              overlayColor: Colors.transparent,
              visible: true,
              curve: Curves.bounceInOut,
              renderOverlay: false,
              children: [
                SpeedDialChild(
                    child:Semantics(
                        label: 'button direction',
                        child: SvgPicture.asset(ImageConstants.icDir,color: AppColors.lightGreyColor,)),
                    backgroundColor: AppColors.blackColor,
                    shape: const CircleBorder(),
                    onTap: () {
                    }),
                SpeedDialChild(
                    child:Semantics(
                        label: 'button call museum',
                        child: SvgPicture.asset(ImageConstants.icCall)),
                    backgroundColor: AppColors.blackColor,
                    shape: const CircleBorder(),
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
                    }),
                SpeedDialChild(
                    child:Semantics(
                        label: 'button collections',
                        child: SvgPicture.asset(ImageConstants.icNavigate,color: AppColors.lightGreyColor,)),
                    backgroundColor: AppColors.blackColor,
                    shape: const CircleBorder(),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 200),
                          reverseDuration: const Duration(milliseconds: 200),
                          child: const ItemScreen(),
                        ),
                      );
                    }),
              ],
            ),
            /*floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 200),
                          reverseDuration: const Duration(milliseconds: 200),
                          child: const ItemScreen(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(ImageConstants.icNavigate)),
                10.heightBox,
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
                    child: SvgPicture.asset(ImageConstants.icCall)),
                10.heightBox,
                SvgPicture.asset(ImageConstants.icDirection),
                60.heightBox
              ],
            ),*/
            body: Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 15, right: 15),
              width: double.maxFinite,
              height: double.maxFinite,
              color: AppColors.grey2Color,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    45.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Semantics(
                              label: 'back button detail screen',
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
                    20.heightBox,
                    RichText(
                        text: TextSpan(
                      text: 'Theia Rating scale : ',
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.lightDarkColor,
                      ), // Default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: '4.5+',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightDarkColor,
                            fontFamily: AppConstants.fontFamily,
                          ),
                        ),
                      ],
                    )),
                    Text(
                      'Albert Hall Museum',
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColors.darkPurpleColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Jaipur',
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColors.lightDarkColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            color: AppColors.blackColor2,
                            width: 1,
                            height: 17,
                          ),
                        ),
                        Text(
                          '23 km',
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColors.lightDarkColor,
                          ),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      children: [
                        Semantics(
                            label: 'theia detail screen',
                            child: Image.asset(ImageConstants.imgSample)),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            children: [
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
                                      child: const GalleryScreen(),
                                    ),
                                  );
                                },
                                child: Semantics(
                                  label: 'theia detail screen',
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 124,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            ImageConstants.imgSample2,
                                            fit: BoxFit.fill,
                                            width: double.maxFinite,
                                            height: double.maxFinite,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'View',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppConstants.fontFamily2,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Gallery',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppConstants.fontFamily2,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              10.heightBox,
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
                                      child: const ArViewScreen(),
                                    ),
                                  );
                                },
                                child: Semantics(
                                  label: 'theia detail screen',
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 78,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightGreyColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(ImageConstants.icRotate),
                                          Text(
                                            'AR view',
                                            style: TextStyle(
                                              fontFamily:
                                                  AppConstants.fontFamily2,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                              color: AppColors.blackColor2,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    25.heightBox,
                    RichReadMoreText(
                      textSpan,
                      settings: LineModeSettings(
                        trimLines: 2,
                        trimCollapsedText: 'Read more...',
                        trimExpandedText: ' Read less ',
                        moreStyle: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: AppConstants.fontFamily),
                        lessStyle: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: AppConstants.fontFamily),
                      ),
                    ),
                    20.heightBox,
                    Row(
                      children: [
                        SvgPicture.asset(ImageConstants.icCalender),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Monday - Friday',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              Text(
                                '4:00PM - 9:00PM',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 15),
                          decoration: BoxDecoration(
                              color: AppColors.darkGreyColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Open',
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.darkBlueColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    20.heightBox,
                   /* Row(
                      children: [
                        SvgPicture.asset(ImageConstants.icLocation),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jaipur',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              Text(
                                '240 m away from centre',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    20.heightBox,*/
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mindmap',
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.blackColor,
                            ),
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstants.icFloor),
                              10.widthBox,
                              Text(
                                '3 Floors',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstants.icGate),
                              10.widthBox,
                              Text(
                                '8 Gates',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstants.icFloor),
                              10.widthBox,
                              Text(
                                '26 Antiques',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstants.icPaint),
                              10.widthBox,
                              Text(
                                '34 Paintings',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstants.icPaint),
                              10.widthBox,
                              Text(
                                '21 Galleries',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rules & Regulations',
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.blackColor,
                            ),
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'No Flash Photography',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'No Food or Drink',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Maintain Silence or Low Noise Levels',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Do Not Touch the Exhibits',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Large Bags and Backpacks',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Services',
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.blackColor,
                            ),
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Guided Tours',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Educational Programs',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Special Exhibitions and Events',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visitor Amenities',
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.blackColor,
                            ),
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Free Water Stations',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Complimentary Wi-Fi',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Coat Check',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                ' Maps and Brochures',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Educational Resources',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              10.widthBox,
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle),
                              ),
                              10.widthBox,
                              Text(
                                'Assistant for visually Impaired',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
