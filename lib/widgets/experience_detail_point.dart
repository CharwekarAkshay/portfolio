import 'package:flutter/material.dart';

import '../constants.dart';

class ExpeirenceDetailPoint extends StatelessWidget {
  final String text;

  const ExpeirenceDetailPoint({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 5),
      child: Row(
        children: [
          const Icon(
            Icons.chevron_right,
            color: themeColor,
          ),
          const SizedBox(width: defaultSizing / 2),
          Text(text)
        ],
      ),
    );
  }
}
