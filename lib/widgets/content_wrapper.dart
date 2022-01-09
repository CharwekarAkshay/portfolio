import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ContentWrapper extends StatelessWidget {
  final Widget child;

  const ContentWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  EdgeInsetsGeometry _getContentPadding(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (size.width > smallDesktopScreenMin) {
      return const EdgeInsets.symmetric(
        vertical: defaultPadding * 6,
        horizontal: defaultPadding * 8,
      );
    } else if (size.width < smallDesktopScreenMin &&
        size.width > mobileScreenMax) {
      return const EdgeInsets.symmetric(
        vertical: defaultPadding * 2,
        horizontal: defaultPadding * 4,
      );
    } else {
      return const EdgeInsets.symmetric(
        vertical: defaultPadding * 2,
        horizontal: defaultPadding * 2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      delay: contentAnimationDelayDuration,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Padding(
          padding: _getContentPadding(context),
          child: child,
        ),
      ),
    );
  }
}
