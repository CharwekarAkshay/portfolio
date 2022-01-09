import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../models/model.dart';

class HeaderLink extends StatefulWidget {
  final LinkModel headerLink;
  const HeaderLink({
    Key? key,
    required this.headerLink,
  }) : super(key: key);

  @override
  _HeaderLinkState createState() => _HeaderLinkState();
}

class _HeaderLinkState extends State<HeaderLink> {
  bool _isHovered = false;

  _handleHover(value) {
    setState(() {
      _isHovered = value;
    });
  }

  _handleOnTap(BuildContext context, Size size) {
    widget.headerLink.onTap(context);
    if (size.width < smallDesktopScreenMin) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => _handleOnTap(context, size),
      onHover: _handleHover,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
        ),
        child: size.width > smallDesktopScreenMin
            ? FullScreenHeaderLink(widget: widget, isHovered: _isHovered)
            : MobileHeaderLink(widget: widget, isHovered: _isHovered),
      ),
    );
  }
}

class MobileHeaderLink extends StatelessWidget {
  const MobileHeaderLink({
    Key? key,
    required this.widget,
    required bool isHovered,
  })  : _isHovered = isHovered,
        super(key: key);

  final HeaderLink widget;
  final bool _isHovered;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.headerLink.textKey,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: defaultPadding / 4),
        AnimatedDefaultTextStyle(
          child: Text(
            widget.headerLink.text,
          ),
          style: GoogleFonts.firaCode().copyWith(
            color: _isHovered ? linkTextColor : textColor,
          ),
          duration: headerLinkDuration,
        )
      ],
    );
  }
}

class FullScreenHeaderLink extends StatelessWidget {
  const FullScreenHeaderLink({
    Key? key,
    required this.widget,
    required bool isHovered,
  })  : _isHovered = isHovered,
        super(key: key);

  final HeaderLink widget;
  final bool _isHovered;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.headerLink.textKey,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(width: defaultPadding / 4),
        AnimatedDefaultTextStyle(
          child: Text(
            widget.headerLink.text,
          ),
          style: GoogleFonts.firaCode().copyWith(
            color: _isHovered ? linkTextColor : textColor,
          ),
          duration: headerLinkDuration,
        )
      ],
    );
  }
}
