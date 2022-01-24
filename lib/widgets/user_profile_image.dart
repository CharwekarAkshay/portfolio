import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
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
  Uint8List? imageData;

  @override
  void initState() {
    _fetchProfileImageUrl();
    super.initState();
  }

  void _handleHover(value) {
    setState(() {
      _isHovered = value;
    });
  }

  double _getImageBoxDimenstion(context) {
    Size size = MediaQuery.of(context).size;
    if (size.width >= extraLargeScreenMin) {
      return 420.00;
    } else if (size.width < extraLargeScreenMin &&
        size.width < extraLargeScreenMin) {
      return 320.00;
    } else if (size.width <= mobileScreenMax) {
      return 120.00;
    }
    return 0.00;
  }

  double _getImageDimenstion(context) {
    Size size = MediaQuery.of(context).size;
    if (size.width >= extraLargeScreenMin) {
      return 400.00;
    } else if (size.width < extraLargeScreenMin &&
        size.width < extraLargeScreenMin) {
      return 300.00;
    } else if (size.width <= mobileScreenMax) {
      return 100.00;
    }
    return 0.00;
  }

  _fetchProfileImageUrl() async {
    Reference imageRefrence =
        FirebaseStorage.instance.ref(prfoilePictureFileName);
    imageRefrence.getData().then((incomingImageData) {
      setState(() {
        imageData = incomingImageData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size.width >= mobileScreenMax
        ? InkWell(
            onTap: () {},
            onHover: _handleHover,
            child: SizedBox(
              height: _getImageBoxDimenstion(context),
              width: _getImageBoxDimenstion(context),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: imagePostioningDuration,
                    left: _isHovered ? 0 : defaultSizing,
                    top: _isHovered ? 0 : defaultSizing,
                    child: Container(
                      height: _getImageDimenstion(context),
                      width: _getImageDimenstion(context),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        border: Border.all(
                          color: themeColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: _getImageDimenstion(context),
                    width: _getImageDimenstion(context),
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: imageData != null
                        ? Image.memory(
                            imageData!,
                            fit: BoxFit.cover,
                            colorBlendMode:
                                _isHovered ? null : BlendMode.multiply,
                            color:
                                _isHovered ? null : themeColor.withOpacity(0.5),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              border: Border.all(
                width: 2,
                color: themeColor,
              ),
            ),
            child: imageData != null
                ? Image.memory(
                    imageData!,
                    fit: BoxFit.cover,
                  )
                : const SizedBox.shrink(),
          );
  }
}
