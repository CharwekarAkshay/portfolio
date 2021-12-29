import 'package:flutter/material.dart';

class HeaderLinkModel {
  final String textKey;
  final String text;
  final Function(BuildContext context) onTap;

  HeaderLinkModel({
    this.textKey = '0.0',
    required this.text,
    required this.onTap,
  });
}
