import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

import 'widgets.dart';

class LeftPane extends StatelessWidget {
  const LeftPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...socialLinks
              .map(
                (link) => SocialIconLink(
                  link: link,
                ),
              )
              .toList(),
          const CustomVerticalDivider()
        ],
      ),
    );
  }
}
