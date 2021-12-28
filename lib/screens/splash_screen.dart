import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Text(
            //   "Hello World",
            // ),
            // Text(
            //   "Hi world",
            //   style: Theme.of(context).textTheme.bodyText1,
            // ),
            // Text(
            //   "Headline 4",
            //   style: Theme.of(context).textTheme.headline5,
            // ),
            // Text(
            //   "Akshay Charwekar",
            //   style: Theme.of(context).textTheme.headline1,
            // ),
            // Text(
            //   "Akshay Charwekar",
            //   style: Theme.of(context).textTheme.headline2,
            // ),
            AnimatedLink(text: "Sample text", onTap: () {},),
            AnimatedButton(),
          ],
        ),
      ),
    );
  }
}
