import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AnimatedLink extends StatefulWidget {
  final String text;
  final Function()? onTap;
  final TextStyle? style;
  final bool disableHoverEffect;

  const AnimatedLink({
    Key? key,
    required this.text,
    this.onTap,
    this.style,
    this.disableHoverEffect = false,
  }) : super(key: key);

  @override
  _AnimatedLinkState createState() => _AnimatedLinkState();
}

class _AnimatedLinkState extends State<AnimatedLink> {
  late bool isHovered = false;

  void _handleHover(bool hovered) {
    setState(() {
      isHovered = hovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: linkTextHighlightDuration,
      decoration: BoxDecoration(
        border: isHovered
            ? const Border(
                bottom: BorderSide(width: 2, color: linkTextColor),
              )
            : null,
      ),
      curve: Curves.easeIn,
      child: InkWell(
        onHover: widget.disableHoverEffect ? null : _handleHover,
        onTap: widget.onTap,
        child: AutoSizeText(
          widget.text,
          style: widget.style ?? Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
