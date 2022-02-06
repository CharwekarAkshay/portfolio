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
          const AutoSizeText(
              'Some projects I have created in my free time for learning purpose. Still working on them will increase quality of applications.I am also on learning journey will try to add new projects.'),
          const SizedBox(height: defaultSizing),
          const WorkGridList()
        ],
      ),
    );
  }
}
