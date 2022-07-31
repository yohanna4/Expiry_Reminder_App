import 'dart:ui';

import 'package:flutter/material.dart';

// final Padding child;
const primaryColor = Color.fromARGB(255, 29, 161, 242);
const lightPrimaryColor = Color.fromARGB(255, 199, 227, 244);
const lightGreyColor = Color.fromARGB(255, 225, 232, 237);
const lightWhiteColor = Color.fromARGB(255, 248, 248, 248);
Widget defaultPadding(Widget child) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: child,
  );
}

Widget titleText(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, top: 25),
    child: Text(
      "$title",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    ),
  );
}
