import 'package:flutter/material.dart';

import '../constants.dart';

class InputTextField extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;
  final bool enabled;
  final int maxLines;
  const InputTextField({
    Key? key,
    required this.fieldName,
    required this.controller,
    this.enabled = true,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$fieldName :',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 18,
              ),
        ),
        const SizedBox(
          height: defaultSizing / 2,
        ),
        TextField(
          enabled: enabled,
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: fieldName,
          ),
        ),
      ],
    );
  }
}
