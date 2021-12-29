import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: defaultSizing * 5,
      child: VerticalDivider(
        color: dividerColor,
        thickness: 3,
        indent: defaultSizing,
        endIndent: 0,
        width: defaultSizing,
      ),
    );
  }
}
