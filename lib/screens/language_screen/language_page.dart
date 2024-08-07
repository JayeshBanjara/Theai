/*
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';
import '../pageview/pageview_screen.dart';
import 'language_page_controller.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final languageController = Get.put(LanguagePageController());
  String language = '';
  late FlutterTts flutterTts;
  late stt.SpeechToText speech;
  bool isNavigated = false; // Add a flag to prevent multiple navigations

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    speech = stt.SpeechToText();
    _requestMicrophonePermission();
  }

  @override
  void dispose() {
    flutterTts.stop();
    speech.stop();
    Get.delete<LanguagePageController>();
    super.dispose();
  }

  Future<void> _requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (status.isDenied) {
      if (await Permission.microphone.request().isGranted) {
        _speak();
      }
    } else if (status.isGranted) {
      _speak();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> _speak() async {
    await flutterTts.speak('Choose Language Screen');

    Future.delayed(const Duration(milliseconds: 1500), () async {
      await flutterTts.speak(
          'Select your preferred language to continue from english or arabic');
    });

    Future.delayed(const Duration(seconds: 5), () {
      _listen();
    });
  }

  void _listen() async {
    bool available = await speech.initialize();
    if (available) {
      setState(() {
        speech.listen(
          onResult: (val) {
            if (!isNavigated) {
              // Check if navigation has not occurred
              setState(() {
                if (val.recognizedWords.toLowerCase() == 'english') {
                  _setLanguage('en');
                } else if (val.recognizedWords.toLowerCase() == 'arabic') {
                  _setLanguage('ar');
                }
              });
            }
          },
        );
      });
    }
  }

  void _setLanguage(String langCode) {
    flutterTts.setLanguage(langCode);
    speech.stop();
    setState(() {
      if (!isNavigated) {
        // Prevent multiple navigations
        isNavigated = true;
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 300),
              reverseDuration: const Duration(milliseconds: 300),
              child: const PageviewScreen(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<LanguagePageController>(
      init: LanguagePageController(),
      builder: (cont) {
        return Scaffold(
          body: Container(
            color: AppColors.blackColor,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                80.heightBox,
                Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(ImageConstants.voiceAnimation),
                ),
                Expanded(child: Container()),
                Semantics(
                  label: 'Choose Language',
                  enabled: true,
                  child: Text(
                    LocaleKeys.chooseLanguage.tr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                20.heightBox,
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isNavigated) {
                          // Prevent multiple navigations
                          _setLanguage('en');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          LocaleKeys.english.tr,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.blackColor2,
                          ),
                        ),
                      ),
                    ),
                    15.widthBox,
                    InkWell(
                      onTap: () {
                        if (!isNavigated) {
                          // Prevent multiple navigations
                          _setLanguage('ar');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          'عربي',
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                100.heightBox,
              ],
            ),
          ),
        );
      },
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:theia/utils/extensions.dart';

import '../../lang/locale_keys.g.dart';
import '../../utils/global.dart';
import '../pageview/pageview_screen.dart';
import 'language_page_controller.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final languageController = Get.put(LanguagePageController());
  String language = '';
  late FlutterTts flutterTts;
  late stt.SpeechToText speech;
  bool isNavigated = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    speech = stt.SpeechToText();
    //_requestMicrophonePermission();
    _checkLocationPermission();
  }

  @override
  void dispose() {
    flutterTts.stop();
    speech.stop();
    Get.delete<LanguagePageController>();
    super.dispose();
  }

  // Check location permission status
  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permission denied");
        _requestMicrophonePermission();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
        print("Location permissions are permanently denied");
        _requestMicrophonePermission();
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
      _requestMicrophonePermission();
    } catch (e) {
      print("Error: $e");
      _requestMicrophonePermission();
    }
  }

  Future<void> _requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (status.isDenied) {
      if (await Permission.microphone.request().isGranted) {
        _checkTalkBackStatus();
      }
    } else if (status.isGranted) {
      _checkTalkBackStatus();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void _checkTalkBackStatus() {
    // Using MediaQuery to check if accessibility features are enabled
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isTalkBackEnabled = MediaQuery.of(context).accessibleNavigation;

      if (isTalkBackEnabled) {
        // If TalkBack is enabled, proceed with TTS instructions
        //_provideTalkBackInstructions();
      } else {
        // If TalkBack is not enabled, use speech-to-text
        _speak();
      }
    });
  }

  Future<void> _provideTalkBackInstructions() async {
    await flutterTts.speak('Choose Language Screen');
    Future.delayed(const Duration(milliseconds: 1500), () async {
      await flutterTts.speak('Select your preferred language to continue from English or Arabic');
    });
  }

  Future<void> _speak() async {
    await flutterTts.speak('Choose Language Screen');
    Future.delayed(const Duration(milliseconds: 1500), () async {
      await flutterTts.speak('Select your preferred language to continue from English or Arabic');
    });

    Future.delayed(const Duration(seconds: 5), () {
      _listen();
    });
  }

  void _listen() async {
    bool available = await speech.initialize();
    if (available) {
      setState(() {
        speech.listen(
          onResult: (val) {
            if (!isNavigated) {
              setState(() {
                if (val.recognizedWords.toLowerCase() == 'english') {
                  _setLanguage('en');
                } else if (val.recognizedWords.toLowerCase() == 'arabic') {
                  _setLanguage('ar');
                }
              });
            }
          },
        );
      });
    }
  }

  void _setLanguage(String langCode) {
    flutterTts.setLanguage(langCode);
    speech.stop();
    setState(() {
      if (!isNavigated) {
        isNavigated = true;
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 300),
            child: const PageviewScreen(),
          ),
              (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<LanguagePageController>(
      init: LanguagePageController(),
      builder: (cont) {
        return Scaffold(
          body: Container(
            color: AppColors.blackColor,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                80.heightBox,
                Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(ImageConstants.voiceAnimation),
                ),
                Expanded(child: Container()),
                Text(
                  LocaleKeys.chooseLanguage.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: AppConstants.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                20.heightBox,
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (!isNavigated) {
                          _setLanguage('en');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          LocaleKeys.english.tr,
                          style: TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.blackColor2,
                          ),
                        ),
                      ),
                    ),
                    15.widthBox,
                    InkWell(
                      onTap: () {
                        if (!isNavigated) {
                          _setLanguage('ar');
                        }
                      },
                      child: Semantics(
                        label: 'arabic',
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'عربي',
                            style: TextStyle(
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                100.heightBox,
              ],
            ),
          ),
        );
      },
    );
  }
}
