import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  static var routeName = "/landingScreen";

  const LandingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Screen Loaded")
    );
  }
}