import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ContentWrapper extends StatelessWidget {
  final Widget child;
  final bool isFixContent;

  const ContentWrapper({
    Key? key,
    required this.child,
    this.isFixContent = false,
  }) : super(key: key);

  EdgeInsetsGeometry _getContentPadding(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (size.width >= smallDesktopScreenMin) {
      return isFixContent
          ? const EdgeInsets.only(
              top: defaultPadding * 6,
              left: defaultPadding * 5,
              right: defaultPadding * 5,
              bottom: defaultSizing * 2,
            )
          : const EdgeInsets.symmetric(
              vertical: defaultPadding * 6,
              horizontal: defaultPadding * 5,
            );
    } else if (size.width < smallDesktopScreenMin &&
        size.width > mobileScreenMax) {
      return isFixContent
          ? const EdgeInsets.only(
              top: defaultPadding * 2,
              left: defaultPadding * 4,
              right: defaultPadding * 4,
              bottom: defaultSizing,
            )
          : const EdgeInsets.symmetric(
              vertical: defaultPadding * 2,
              horizontal: defaultPadding * 4,
            );
    } else {
      return isFixContent
          ? const EdgeInsets.only(
              top: defaultPadding * 2,
              left: defaultPadding * 2,
              right: defaultPadding * 2,
              bottom: defaultSizing * 0.5,
            )
          : const EdgeInsets.symmetric(
              vertical: defaultPadding * 2,
              horizontal: defaultPadding * 2,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      duration: contentLoadingDuration,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          maxHeight: isFixContent
              ? MediaQuery.of(context).size.height
              : double.infinity,
        ),
        child: Padding(
          padding: _getContentPadding(context),
          child: child,
        ),
      ),
    );
  }
}
