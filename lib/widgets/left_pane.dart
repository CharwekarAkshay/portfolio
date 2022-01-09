import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

import 'widgets.dart';

class LeftPane extends StatelessWidget {
  const LeftPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return size.width > smallDesktopScreenMin
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: FadeInUp(
              delay: sidePaneAnimationDelayDuration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...socialLinks
                      .map(
                        (link) => SocialIconLink(
                          link: link,
                        ),
                      )
                      .toList(),
                  const CustomVerticalDivider()
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
