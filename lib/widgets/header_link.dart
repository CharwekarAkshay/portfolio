import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../models/model.dart';

class HeaderLink extends StatefulWidget {
  final HeaderLinkModel headerLink;
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.headerLink.onTap,
      onHover: _handleHover,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
        ),
        child: Row(
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
        ),
      ),
    );
  }
}
