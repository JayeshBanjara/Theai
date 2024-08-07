import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:theia/screens/pageview/pageview_controller.dart';
import 'package:theia/screens/pageview/terms_screen.dart';
import 'package:theia/screens/pageview/theme_screen.dart';
import 'package:theia/screens/pageview/visual_preference_screen.dart';
import 'package:theia/screens/pageview/warning_screen.dart';
import 'package:theia/screens/pageview/welcome/welcome_screen.dart';
import 'package:theia/screens/pageview/wl_screen.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';
import '../welcome2_screen/welcome2_screen.dart';
import 'about_theia_screen.dart';
import 'avoid_screen.dart';
import 'data_screen.dart';
import 'sound_preference_screen.dart';

class PageviewScreen extends StatefulWidget {
  const PageviewScreen({super.key});

  @override
  State<PageviewScreen> createState() => _PageviewScreenState();
}

class _PageviewScreenState extends State<PageviewScreen> {

  final pageViewController = Get.put(PageViewController());
  String language = '';

  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    const WelcomeScreen(),
    const AboutTheiaScreen(),
    const ThemeScreen(),
    const AvoidScreen(),
    const VisualPreferenceScreen(),
    const SoundPreferenceScreen(),
    const WlScreen(),
    const WarningScreen(),
    const DataScreen(),
    const TermsScreen(),
  ];

  @override
  void dispose() {
    pageViewController.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<PageViewController>(
        init: PageViewController(),
        builder: (cont) {
          pageViewController.context = context;
          return PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) async {
              if (didPop) return;
              if (_currentPage > 0) {
                _controller.animateToPage(
                  _currentPage - 1,
                  duration: const Duration(
                      milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                SystemNavigator.pop(animated: true);
              }
              pageViewController.update();
            },
            child: Scaffold(
                body: Container(
                  color: AppColors.greyColor,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: _pages.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return _pages[index];
                          },
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                        ),
                      ),

                      LinearPercentIndicator(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        lineHeight: 3.0,
                        percent: (_currentPage + 1) / _pages.length,
                        barRadius: const Radius.circular(3),
                        backgroundColor: Colors.grey,
                        progressColor: AppColors.blackColor2,
                      ),
                      15.heightBox,

                      if (_currentPage == 0 || _currentPage == 9)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () {
                              if (_currentPage < _pages.length - 1) {
                                _controller.animateToPage(
                                  _currentPage + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else if(_currentPage == 9){
                                pageViewController.onClicked();
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: const Duration(milliseconds: 300),
                                    reverseDuration: const Duration(
                                        milliseconds: 300),
                                    child: const Welcome2Screen(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                LocaleKeys.getStarted.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                      if (_currentPage == 1)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () {
                              if (_currentPage < _pages.length - 1) {
                                _controller.animateToPage(
                                  _currentPage + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                LocaleKeys.customise.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                      if (_currentPage == 6)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () {
                              if (_currentPage < _pages.length - 1) {
                                _controller.animateToPage(
                                  _currentPage + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                LocaleKeys.givePermission.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                      if (_currentPage == 2 || _currentPage == 3 ||
                          _currentPage == 4 || _currentPage == 5 ||
                          _currentPage == 7 || _currentPage == 8)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (_currentPage > 0) {
                                      _controller.animateToPage(
                                        _currentPage - 1,
                                        duration: const Duration(
                                            milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                    pageViewController.update();
                                  },
                                  child: Semantics(
                                    label: 'back button',
                                    child: SvgPicture.asset(
                                        ImageConstants.icArrow),
                                  )),
                              5.widthBox,
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    if (_currentPage < _pages.length - 1) {
                                      _controller.animateToPage(
                                        _currentPage + 1,
                                        duration: const Duration(
                                            milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: AppColors.blackColor,
                                        borderRadius: BorderRadius.circular(
                                            10.0)),
                                    child: Text(
                                      LocaleKeys.continue1.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      30.heightBox
                    ],
                  ),
                )
            ),
          );
        });
  }
}
