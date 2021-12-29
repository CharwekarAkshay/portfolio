import 'package:flutter/material.dart';
import 'package:portfolio/provider/general_provider.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var _scrollViewController =
    // Provider.of<GeneralProvider>(context, listen: false)
    // .scrollViewController;
    return ScrollablePositionedList.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        height: 500,
        child: Text('Item $index'),
      ),
      itemScrollController:
          Provider.of<GeneralProvider>(context).itemScrollController,
      itemPositionsListener:
          Provider.of<GeneralProvider>(context).itemPositionsListener,
    );
    ;
  }
}
