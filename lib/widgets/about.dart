import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/model.dart';
import 'widgets.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinkModel link = links[0];
    var size = MediaQuery.of(context).size;

    return ContentWrapper(
      child: Column(
        children: [
          ContentHeader(link: link),
          const SizedBox(height: defaultSizing),
          size.width > extraLargeScreenMin
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        '${information['aboutMeDetailed']}',
                      ),
                    ),
                    const SizedBox(width: defaultSizing / 2),
                    const UserProfileImage()
                  ],
                )
              : Flex(
                direction: Axis.vertical,
                  children: [
                    AutoSizeText(
                      '${information['aboutMeDetailed']}',
                    ),
                    const SizedBox(height: defaultSizing * 2), 
                    const UserProfileImage()
                  ],
                ),
          const SizedBox(height: defaultSizing * 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Here are a few technologies I’ve been working on recently:',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 20,
                    ),
              ),
              const SizedBox(height: defaultSizing),
              const SkillSet(),
            ],
          ),
          const SizedBox(height: defaultSizing * 4),
          const MoveNextButton(index: 2),
        ],
      ),
    );
  }
}
