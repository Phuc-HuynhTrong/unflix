import 'package:flutter/material.dart';
class TextInApp {
  TextStyle subtitle(Color color, BuildContext context) {
    return TextStyle(
      color: color,
      fontSize: 13,
      fontWeight: FontWeight.w500
    );
  }
  TextStyle headline5(Color color, BuildContext context) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500
    );
  }
  TextStyle headline6(Color color, BuildContext context) {
    return TextStyle(
        color: color,
        fontSize: 15,
        fontWeight: FontWeight.w500
    );
  }
}