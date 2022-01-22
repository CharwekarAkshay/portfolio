import 'package:flutter/material.dart';

import '../constants.dart';

class InputTextField extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;
  final bool enabled;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;

  const InputTextField({
    Key? key,
    required this.fieldName,
    required this.controller,
    required this.textInputAction,
    this.enabled = true,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
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
          autofocus: false,
          enableInteractiveSelection: true,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            hintText: fieldName,
          ),
        ),
      ],
    );
  }
}
