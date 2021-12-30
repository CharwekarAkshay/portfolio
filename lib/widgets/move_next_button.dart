import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import '../provider/provider.dart';

class MoveNextButton extends StatelessWidget {
  final int index;

  const MoveNextButton({
    Key? key,
    required this.index,
  }) : super(key: key);

  _handleViewMore(context) {
    (Provider.of<GeneralProvider>(
      context,
      listen: false,
    ).itemScrollController as ItemScrollController)
        .scrollTo(
      index: index,
      duration: scrollInViewDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_downward,
            color: themeColor,
          ),
          onPressed: () => _handleViewMore(context),
        )
      ],
    );
  }
}
