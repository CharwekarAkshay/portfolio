import 'package:flutter/material.dart';

import '../constants.dart';

class UserProfileImage extends StatefulWidget {
  const UserProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserProfileImage> createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {
  bool _isHovered = false;

  void _handleHover(value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: _handleHover,
      child: Container(
        height: 420,
        width: 420,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: imagePostioningDuration,
              left: _isHovered ? 0 : defaultSizing,
              top: _isHovered ? 0 : defaultSizing,
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  border: Border.all(
                    color: themeColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              width: 400,
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
                colorBlendMode: _isHovered ? null : BlendMode.multiply,
                color: _isHovered ? null : themeColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
