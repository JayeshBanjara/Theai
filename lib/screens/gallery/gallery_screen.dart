import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theia/lang/locale_keys.g.dart';
import 'package:theia/utils/extensions.dart';

import '../../utils/global.dart';
import 'gallery_controller.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final galleryController = Get.put(GalleryController());
  String language = '';

  @override
  void dispose() {
    Get.delete<GalleryController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<GalleryController>(
        init: GalleryController(),
        builder: (cont) {
          return Scaffold(
            body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: AppColors.greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Semantics(
                          label: 'theia gallery',
                          child: Image.asset(ImageConstants.imgMuseum,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,)),
                      Column(
                        children: [
                          45.heightBox,
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Semantics(
                                        label: 'back button gallery',
                                        child: SvgPicture.asset(ImageConstants.icBack,height: 26,width: 26,color: AppColors.lightGreyColor,))),
                                /*SvgPicture.asset(ImageConstants.icFav,height: 40,width: 40)*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  20.heightBox,

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              galleryController.categorySelected = 1;
                              galleryController.update();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: galleryController.categorySelected == 1
                                  ? AppColors.blackColor
                                  :Colors.white
                              ),
                              child: Text(
                                "${LocaleKeys.category.tr} 1" ,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: galleryController.categorySelected == 1
                                  ? Colors.white
                                  :AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          10.widthBox,
                          InkWell(
                            onTap: (){
                              galleryController.categorySelected = 2;
                              galleryController.update();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: galleryController.categorySelected == 2
                                      ? AppColors.blackColor
                                      :Colors.white
                              ),
                              child: Text(
                                "${LocaleKeys.category.tr} 2" ,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: galleryController.categorySelected == 2
                                      ? Colors.white
                                      :AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          10.widthBox,
                          InkWell(
                            onTap: (){
                              galleryController.categorySelected = 3;
                              galleryController.update();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: galleryController.categorySelected == 3
                                      ? AppColors.blackColor
                                      :Colors.white
                              ),
                              child: Text(
                                "${LocaleKeys.category.tr} 3" ,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: galleryController.categorySelected == 3
                                      ? Colors.white
                                      :AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          10.widthBox,
                          InkWell(
                            onTap: (){
                              galleryController.categorySelected = 4;
                              galleryController.update();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: galleryController.categorySelected == 4
                                      ? AppColors.blackColor
                                      :Colors.white
                              ),
                              child: Text(
                                "${LocaleKeys.category.tr} 4" ,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: galleryController.categorySelected == 4
                                      ? Colors.white
                                      :AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          15.widthBox,
                        ],
                      ),
                    ),
                  ),
                  20.heightBox,

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 15),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.97 / 2),
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return categoryItem();
                        },
                      ),
                    ),
                  ),


                ],
              ),
            ),
          );
        });
  }
}

Widget categoryItem() {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
            label: 'theia gallery',
            child: Image.asset(ImageConstants.imgStatue,width:double.maxFinite,fit: BoxFit.fill,)),
        10.heightBox,

        Text(
          "Oct 29, 2022" ,
          style: TextStyle(
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: AppColors.blackColor,
          ),
        ),
        2.heightBox,

        Text(
          LocaleKeys.rueDeRivoli.tr,
          style: TextStyle(
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.blackColor,
          ),
        ),
        3.heightBox,

        Text(
          LocaleKeys.galleryDes.tr,
          style: TextStyle(
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: AppColors.blackColor,
          ),
        ),
      ],
    ),
  );
}
