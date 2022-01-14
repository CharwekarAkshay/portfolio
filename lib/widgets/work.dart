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
        children: [
          ContentHeader(link: link),
          const AutoSizeText('Somethings that I worked on'),
          const WorkGridList()
        ],
      ),
    );
  }
}