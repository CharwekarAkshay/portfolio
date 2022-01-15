import 'package:auto_animated/auto_animated.dart';
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

  final options = const LiveOptions(
    // Show each item through (default 250)
    showItemInterval: gridShowItemInterval,

    // Animation duration (default 250)
    showItemDuration: gridShowItemDuration,
  );
  @override
  Widget build(BuildContext context) {
    return LiveGrid.options(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _gridCrossAxisSize(context),
        crossAxisSpacing: defaultSizing,
        mainAxisSpacing: defaultSizing,
      ),
      options: options,
      itemBuilder: (context, index, animation) => GitProject(
        animation: animation,
        gitProject: gitProjectList[index],
      ),
      itemCount: gitProjectList.length,
    );
  }
}
