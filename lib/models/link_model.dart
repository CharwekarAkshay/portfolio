import 'package:flutter/material.dart';

class LinkModel {
  final String textKey;
  final String text;
  final Function(BuildContext context) onTap;

  LinkModel({
    this.textKey = '0.0',
    required this.text,
    required this.onTap,
  });
}
