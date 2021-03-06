import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Function()? onTap;

  const AnimatedButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;

  void _handleHover(value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: _handleHover,
      child: AnimatedContainer(
        duration: buttonHighlightDuration,
        padding: const EdgeInsets.symmetric(
          vertical: defaultPadding / 2,
          horizontal: defaultPadding,
        ),
        decoration: BoxDecoration(
          color: _isHovered ? highlightedButtonColor : Colors.transparent,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          border: Border.all(
            color: themeColor,
            width: 2,
          ),
        ),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
