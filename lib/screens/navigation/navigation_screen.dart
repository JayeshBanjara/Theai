import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theia/utils/extensions.dart';

import '../../utils/global.dart';
import '../home/home_screen.dart';
import '../user_guide/user_guide_screen.dart';
import 'navigation_controller.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final navigationController = Get.put(NavigationController());
  String language = '';

  @override
  void dispose() {
    Get.delete<NavigationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (cont) {
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(15),
              color: AppColors.blackColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  45.heightBox,
                  Align(
                   alignment: Alignment.topRight,
                     child: InkWell(
                       onTap: (){
                         Navigator.pop(context);
                       },
                         child: const Icon(Icons.close,color: Colors.white,size: 34,))),

                  60.heightBox,

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration:  const Duration(milliseconds:600),
                          reverseDuration: const Duration(milliseconds:600),
                          child: const HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration:  const Duration(milliseconds:600),
                          reverseDuration: const Duration(milliseconds:600),
                          child: const UserGuideScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'User Guide',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Text(
                    'Preferences',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    'Help',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),

                  Expanded(child: Container()),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(ImageConstants.logo,
                    width: MediaQuery.of(context).size.width/1.5,
                    fit: BoxFit.fill,),
                  ),

                  30.heightBox,
                ],
              ),
            ),
          );
        });
  }
}
