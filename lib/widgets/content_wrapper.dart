import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ContentWrapper extends StatelessWidget {
  final Widget child;

  const ContentWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      delay: contentAnimationDelayDuration,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding * 6,
            horizontal: defaultPadding * 8,
          ),
          child: child,
        ),
      ),
    );
  }
}
