import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import '../provider/provider.dart';
import '../widgets/content.dart';
import '../widgets/widgets.dart';

class LandingScreen extends StatelessWidget {
  static var routeName = '/landingScreen';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var awayFromTop = Provider.of<GeneralProvider>(context).awayFromTop;
    var scaffoldKey =
        Provider.of<GeneralProvider>(context, listen: false).scaffoldKey;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
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
      ),
      floatingActionButton: awayFromTop
          ? Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: FloatingActionButton(
                mini:  !(MediaQuery.of(context).size.width > smallDesktopScreenMin),
                onPressed: () {
                  (Provider.of<GeneralProvider>(
                    context,
                    listen: false,
                  ).itemScrollController as ItemScrollController)
                      .scrollTo(
                    index: 0,
                    duration: scrollInViewDuration,
                  );
                },
                child: const Icon(
                  Icons.arrow_upward,
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      endDrawer: const DrawerMenu(),
    );
  }
}
