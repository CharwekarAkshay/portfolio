
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/link_model.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({
    Key? key,
    required this.link,
  }) : super(key: key);

  final LinkModel link;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          link.textKey,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(width: defaultSizing / 2),
        Text(
          link.text,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(width: defaultSizing),
        const Expanded(
          child: Divider(
            color: dividerColor,
          ),
        ),
      ],
    );
  }
}
