import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/model.dart';
import 'widgets.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinkModel link = links[1];
    return ContentWrapper(
        child: Column(
      children: [
        ContentHeader(link: link),
        const SizedBox(height: defaultSizing),
      ],
    ));
  }
}
