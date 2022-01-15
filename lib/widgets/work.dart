import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/model.dart';
import 'widgets.dart';

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinkModel link = links[2];
    return ContentWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentHeader(link: link),
          const SizedBox(height: defaultSizing),
          const AutoSizeText('Somethings that I worked on'),
          const SizedBox(height: defaultSizing),
          const WorkGridList()
        ],
      ),
    );
  }
}
