import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ExpeirenceDetailPoint extends StatelessWidget {
  final String text;

  const ExpeirenceDetailPoint({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '> ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ]
      )
    );
  }
}
