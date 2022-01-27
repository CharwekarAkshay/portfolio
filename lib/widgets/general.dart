import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets.dart';

class General extends StatelessWidget {
  const General({Key? key}) : super(key: key);

  _getMainFontSize(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= extraLargeScreenMin) {
      return 80;
    } else if (screenWidth < extraLargeScreenMin &&
        screenWidth >= desktopScreenMin) {
      return screenWidth * 70;
    } else if (screenWidth < desktopScreenMin &&
        screenWidth >= smallDesktopScreenMin) {
      return screenWidth * 50;
    } else if (screenWidth < smallDesktopScreenMin &&
        screenWidth >= tabletScreenMin) {
      return screenWidth * 40;
    } else {
      return 35;
    }
  }

  _getMessageBoxMaxWidth(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= extraLargeScreenMin) {
      return screenWidth * 0.5;
    } else if (screenWidth < extraLargeScreenMin &&
        screenWidth >= desktopScreenMin) {
      return screenWidth * 0.6;
    } else if (screenWidth < desktopScreenMin &&
        screenWidth >= smallDesktopScreenMin) {
      return screenWidth * 0.7;
    } else if (screenWidth < smallDesktopScreenMin &&
        screenWidth >= tabletScreenMin) {
      return screenWidth * 0.8;
    } else {
      return screenWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Hi, My name is',
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 1,
          ),
          const SizedBox(height: defaultSizing),
          AutoSizeText(
            '$userFirstName $userLastName.',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: _getMainFontSize(context),
                ),
            maxLines: 2,
          ),
          const SizedBox(height: defaultSizing),
          AutoSizeText(
            '${information['quotedText']}',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: _getMainFontSize(context),
                ),
            maxLines: 2,
          ),
          const SizedBox(height: defaultSizing),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: _getMessageBoxMaxWidth(context),
            ),
            child: AutoSizeText(
              '${information['aboutMe']}',
            ),
          ),
          const SizedBox(height: defaultSizing * 8),
          const MoveNextButton(index: 1),
        ],
      ),
    );
  }
}
