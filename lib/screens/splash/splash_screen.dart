import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:theia/screens/splash/splash_controller.dart';

import '../../utils/global.dart';
import '../../utils/my_shared_preferences.dart';
import '../home/home_screen.dart';
import '../language_screen/language_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final splashController = Get.put(SplashController());

  String language = '';

  late FlutterTts flutterTts;
  late stt.SpeechToText speech;

  late AnimationController _controller;
  late Animation<double> _animation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playAudio() async {
    // Load and play the audio from assets
    await _audioPlayer.play(AssetSource('sounds/splash_audio.mp3'));
  }

  @override
  void initState() {
    super.initState();

    //flutterTts = FlutterTts();
    //speech = stt.SpeechToText();
    //_speak();

    _playAudio();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation when the screen is displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });

    MySharedPreferences.instance
        .getBoolValuesSF(SharedPreferencesKeys.isOnBodingClicked)
        .then((value) async {
      if (value != null) {
        splashController.isOnBodingClicked = value;
        Future.delayed(const Duration(seconds: 5), () {
          if (splashController.isOnBodingClicked == true) {

            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const HomeScreen()));
          } else {

            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 1),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) =>
                    const LanguagePage()));
          }
        });
      }
    });
  }

  Future<void> _speak() async {
    await flutterTts.speak('Splash Screen');
    Future.delayed(const Duration(milliseconds: 1500), () async {
      await flutterTts.speak('Welcome to Theia Ready to begin?');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    Get.delete<SplashController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    language = Get.locale!.languageCode;
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (cont) {
          return Scaffold(
              body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.blackColor,
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                double bottomPosition = 0 +
                    (MediaQuery.of(context).size.height / 2 - 50) *
                        _animation.value;
                return Stack(
                  children: [
                    Positioned(
                      bottom: bottomPosition,
                      left: MediaQuery.of(context).size.width / 2 - 50,
                      child: SvgPicture.asset(ImageConstants.logo),
                    ),
                  ],
                );
              },
            ),
          ));
        });
  }
}
