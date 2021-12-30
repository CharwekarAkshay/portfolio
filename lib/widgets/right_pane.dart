import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/email_link.dart';

import '../constants.dart';
import 'widgets.dart';

class RightPane extends StatelessWidget {
  const RightPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      child: FadeInUp(
        delay: sidePaneAnimationDelayDuration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            EmailLink(),
            CustomVerticalDivider()
          ],
        ),
      ),
    );
  }
}
