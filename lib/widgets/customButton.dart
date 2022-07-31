import 'dart:ui';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final double height;
  final GestureTapCallback onPressed;
  final width;

  const CustomButton(
      {required this.inputText,
      required this.height,
      required this.onPressed,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? MediaQuery.of(context).size.width / 1.4 : width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 98, 102, 243),
            Color.fromARGB(255, 149, 93, 245),
            Color(0xff9450e7),
            Color(0xff9450e7),
            Color(0xff9450e7),
          ],
        ),
        borderRadius: BorderRadius.circular(5.0),
        // color: Color(0xff9450e7),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          inputText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
