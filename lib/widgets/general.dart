import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets.dart';

class General extends StatelessWidget {
  const General({Key? key}) : super(key: key);

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
            style: Theme.of(context).textTheme.headline1,
            maxLines: 1,
          ),
          const SizedBox(height: defaultSizing),
          AutoSizeText(
            '${information['quotedText']}',
            style: Theme.of(context).textTheme.headline2,
            maxLines: 1,
          ),
          const SizedBox(height: defaultSizing),
          AutoSizeText(
            '${information['aboutMe']}',
          ),
          const SizedBox(height: defaultSizing * 8),
          const MoveNextButton(index: 1),
        ],
      ),
    );
  }
}
