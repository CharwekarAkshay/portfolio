import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import '../provider/general_provider.dart';

class AnimatedLogo extends StatefulWidget {
  final String text;
  const AnimatedLogo({
    Key? key,
    this.text = userFirstName,
  }) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool _isHovered = false;

  _handleHover(value) {
    setState(() {
      _isHovered = value;
    });
  }

  _scrollToTop() {
    (Provider.of<GeneralProvider>(
      context,
      listen: false,
    ).itemScrollController as ItemScrollController)
        .scrollTo(
      index: 0,
      duration: scrollInViewDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _scrollToTop(),
      onHover: _handleHover,
      child: _isHovered
          ? AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  widget.text,
                  speed: headerLogoDuration,
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: linkTextColor),
                )
              ],
              isRepeatingAnimation: true,
            )
          : AnimatedDefaultTextStyle(
              child: Text(
                widget.text[0].toUpperCase(),
              ),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: linkTextColor,
                  ),
              duration: headerLogoDuration,
            ),
    );
  }
}
