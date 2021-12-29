import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AnimatedLogo extends StatefulWidget {
  final String text;
  const AnimatedLogo({
    Key? key,
    required this.text,
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
