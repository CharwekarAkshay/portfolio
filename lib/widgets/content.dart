import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../provider/provider.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        Provider.of<GeneralProvider>(
          context,
          listen: false
        ).setScrollDirection(notification);
        return false;
      },
      child: ScrollablePositionedList.builder(
        itemCount: contentList.length,
        itemBuilder: (context, index)  {
          return contentList[index];
        },
        itemScrollController:
            Provider.of<GeneralProvider>(context).itemScrollController,
        itemPositionsListener:
            Provider.of<GeneralProvider>(context).itemPositionsListener,
      ),
    );
    ;
  }
}
