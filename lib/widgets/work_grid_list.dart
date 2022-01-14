import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets.dart';

class WorkGridList extends StatelessWidget {
  const WorkGridList({Key? key}) : super(key: key);

  int _gridCrossAxisSize(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (size.width >= desktopScreenMin) {
      return 3;
    } else if (size.width < desktopScreenMin && size.width >= tabletScreenMin) {
      return 2;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _gridCrossAxisSize(context),
        crossAxisSpacing: defaultSizing,
        mainAxisSpacing: defaultSizing,
      ),
      itemBuilder: (context, index) => GitProject(
        gitProject: gitProjectList[index],
      ),
      itemCount: gitProjectList.length,
    );
  }
}
