import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:theia/screens/pageview/pageview_controller.dart';
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';

class AboutTheiaScreen extends StatefulWidget {
  const AboutTheiaScreen({super.key});

  @override
  State<AboutTheiaScreen> createState() => _AboutTheiaScreenState();
}

class _AboutTheiaScreenState extends State<AboutTheiaScreen> with SingleTickerProviderStateMixin {
  final aboutController = Get.put(PageViewController());

  String language = '';

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

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
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: AppColors.greyColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Semantics(
                        label: 'Thiea About',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/2.2,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)
                              )
                          ),
                          child: CircularRevealAnimation(
                              animation: animation,
                              centerOffset: const Offset(205, 200),
                              minRadius: 10,
                              maxRadius: 400,
                              child: Image.asset(ImageConstants.img,fit: BoxFit.fill)),
                        ),
                      ),

                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          LocaleKeys.aboutDescription.tr,
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
                        child: Text(
                          LocaleKeys.aboutShortDescription.tr,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      50.heightBox,
                    ],
                  ),
                ),
                Positioned(
                    bottom: MediaQuery.of(context).size.height /2.6, // Adjust as necessary
                    right: MediaQuery.of(context).size.width / 20,
                    child:Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blackColor,width: 0.5),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        decoration: BoxDecoration(
                            color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: SizedBox(
                          width: 100,
                            height: 60,
                            child: Lottie.asset(ImageConstants.voiceAnimation)),
                      ),
                    ),),
              ],
            ),
          );
        });
  }
}
