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
          const MoveNextButton(index: 1),
        ],
      ),
    );
  }
}
