import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/model.dart';
import 'widgets.dart';

class Work extends StatelessWidget {
  
  const Work({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  LinkModel link = links[3];
    return ContentWrapper(
      child: Column(
        children: [
          ContentHeader(link: link),
        ],
      ),
    );
  }
}