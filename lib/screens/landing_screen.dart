import 'package:flutter/material.dart';
import 'package:portfolio/widgets/content.dart';

import '../widgets/widgets.dart';

class LandingScreen extends StatelessWidget {
  static var routeName = "/landingScreen";

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              children: const [
                LeftPane(),
                Expanded(
                  child: Content(),
                ),
                RightPane()
              ],
            ),
          )
        ],
      ),
    );
  }
}
