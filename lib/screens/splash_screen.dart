import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import './landing_Screen.dart';
import '../constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
     _startTime();
    super.initState();
  }
  
  _startTime() async {
    return Timer(loadingScreenDuration, () {
      Navigator.pushNamedAndRemoveUntil(context, LandingScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextLiquidFill(
            text: 'Akshay\nCharwekar',
            waveColor: themeColor,
            boxBackgroundColor: scaffoldColor,
            textStyle: Theme.of(context).textTheme.headline1 ?? const TextStyle(),
            boxWidth: double.infinity,
            boxHeight: 400,
            loadDuration: loadingScreenDuration,
          )
        ],
      ),
    );
  }
}
