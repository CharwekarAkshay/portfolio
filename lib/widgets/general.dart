import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import '../provider/provider.dart';
import 'widgets.dart';

class General extends StatelessWidget {
  const General({Key? key}) : super(key: key);

  _handleViewMore(context) {
    (Provider.of<GeneralProvider>(
      context,
      listen: false,
    ).itemScrollController as ItemScrollController)
        .scrollTo(
      index: 1,
      duration: scrollInViewDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, My name is',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: defaultSizing),
          Text(
            '$userFirstName $userLastName.',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: defaultSizing),
          Text(
            '${information['quotedText']}',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: defaultSizing),
          Text(
            '${information['aboutMe']}',
          ),
          const SizedBox(height: defaultSizing * 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_downward,
                  color: themeColor,
                ),
                onPressed: () => _handleViewMore(context),
              )
            ],
          )
        ],
      ),
    );
  }
}
