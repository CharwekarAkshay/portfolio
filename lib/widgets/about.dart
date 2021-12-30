import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/model.dart';
import 'widgets.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinkModel link = links[0];
    return ContentWrapper(
      child: Column(
        children: [ContentHeader(link: link)],
      ),
    );
  }
}