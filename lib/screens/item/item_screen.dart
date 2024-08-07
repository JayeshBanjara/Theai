import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theia/utils/extensions.dart';

import '../../utils/global.dart';
import 'item_controller.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final itemController = Get.put(ItemController());
  String language = '';
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    Get.delete<ItemController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<ItemController>(
        init: ItemController(),
        builder: (cont) {
          return Scaffold(
            key: _key,
            body: Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 15, right: 15),
              width: double.maxFinite,
              height: double.maxFinite,
              color: AppColors.greyColor,
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
                              label: 'back button collections screen',
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
                    Text(
                      'Collections',
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColors.darkPurpleColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.black,
                            isDense: true,
                            value: itemController.selectedItem,
                            hint: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text('Category',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      fontFamily: AppConstants.fontFamily)),
                            ),
                            icon: SvgPicture.asset(ImageConstants.icDownArrow),
                            iconSize: 24,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            onChanged: (String? newValue) {
                              setState(() {
                                itemController.selectedItem = newValue;
                              });
                            },
                            items: itemController.dropdownItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: AppConstants.fontFamily)),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Highly Rated',
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.darkPurpleColor,
                      ),
                    ),
                    15.heightBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white70])),
                      child: Row(
                        children: [
                          Semantics(
                            label: 'theia items',
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(ImageConstants.icCross)),
                          ),
                          15.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sculpture 19',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                Text(
                                  '134-162  BC',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(ImageConstants.icArrowRound)
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white70])),
                      child: Row(
                        children: [
                          Semantics(
                            label: 'theia items',
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(ImageConstants.icCross)),
                          ),
                          15.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sculpture 19',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                Text(
                                  '134-162  BC',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(ImageConstants.icArrowRound)
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white70])),
                      child: Row(
                        children: [
                          Semantics(
                            label: 'theia items',
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(ImageConstants.icCross)),
                          ),
                          15.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sculpture 19',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                Text(
                                  '134-162  BC',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(ImageConstants.icArrowRound)
                        ],
                      ),
                    ),
                    10.heightBox,
                    Text(
                      'Most visited',
                      style: TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.darkPurpleColor,
                      ),
                    ),
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white70])),
                      child: Row(
                        children: [
                          Semantics(
                            label: 'theia items',
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(ImageConstants.icCross)),
                          ),
                          15.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sculpture 19',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                Text(
                                  '134-162  BC',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(ImageConstants.icArrowRound)
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white70])),
                      child: Row(
                        children: [
                          Semantics(
                            label: 'theia items',
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(ImageConstants.icCross)),
                          ),
                          15.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sculpture 19',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                Text(
                                  '134-162  BC',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(ImageConstants.icArrowRound)
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white70])),
                      child: Row(
                        children: [
                          Semantics(
                            label: 'theia items',
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(ImageConstants.icCross)),
                          ),
                          15.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sculpture 19',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                Text(
                                  '134-162  BC',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontFamily2,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(ImageConstants.icArrowRound)
                        ],
                      ),
                    ),
                    10.heightBox,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
