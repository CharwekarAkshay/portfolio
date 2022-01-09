import 'package:auto_size_text/auto_size_text.dart';
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
        AutoSizeText(
          link.textKey,
          style: Theme.of(context).textTheme.headline4,
        ),
        AutoSizeText(
          link.text,
          style: Theme.of(context).textTheme.headline5,
        ),
        // AutoSizeText.rich(
        //   TextSpan(
        //     children: [
        //       TextSpan(
        //         text: link.textKey,
        //         style: Theme.of(context).textTheme.headline4,
        //       ),
        //       const TextSpan(
        //         text: ' ',
        //       ),
        //       TextSpan(
        //         text: link.text,
        //         style: Theme.of(context).textTheme.headline5,
        //       )
        //     ],
        //   ),
        // ),
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
