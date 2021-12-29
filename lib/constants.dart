import 'package:flutter/material.dart';

import 'models/model.dart';

// Colors

const MaterialColor themeColor = Colors.teal;

const Color scaffoldColor = Color.fromRGBO(10, 25, 47, 1);

const Color linkTextColor = Color.fromRGBO(100, 255, 218, 1);

const Color textColor = Color.fromRGBO(136, 146, 176, 1);

const Color headingTextColor = Color.fromRGBO(136, 146, 176, 1);

const Color quotedTextColor = Color.fromRGBO(136, 146, 176, 1);

const Color highlightedButtonColor = Color.fromRGBO(100, 255, 218, 0.1);

const Color headerColor = Color.fromRGBO(10, 25, 47, 0.85);

// Animation
const Duration linkTextHighlightDuration = Duration(milliseconds: 300);

const Duration buttonHighlightDuration = Duration(milliseconds: 200);

// const Duration loadingScreenDuration = Duration(seconds: 8);
const Duration loadingScreenDuration = Duration(seconds: 1);

const Duration headerDuration = Duration(milliseconds: 200);

const Duration headerLinkDuration = Duration(milliseconds: 200);

const Duration headerLogoDuration = Duration(milliseconds: 300);

// Sizing
const double defaultPadding = 20.00;
const double defaultBorderRadius = 5.00;

// Application Constant
List<HeaderLinkModel> headerLinks = [
  HeaderLinkModel(text: "About", onTap: () {}, textKey: "01."),
  HeaderLinkModel(text: "Experience", onTap: () {}, textKey: "02."),
  HeaderLinkModel(text: "Work", onTap: () {}, textKey: "03."),
  HeaderLinkModel(text: "Contact", onTap: () {}, textKey: "04.")
];


// User Constants

const String userFirstName = "Akshay";

const String userLastName = "Charwekar";

const String userEmail = "charwekar12@gmail.com";