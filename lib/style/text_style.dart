import 'package:flutter/material.dart';

class TextInApp {
  TextStyle subtitle(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w500);
  }

  TextStyle headline5(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500);
  }

  TextStyle headline6(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w500);
  }

  TextStyle navigation(Color color, BuildContext context) {
    return TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w600);
  }
}

final kLTTile = TextStyle(
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 122, 122, 122),
  fontSize: 18.0,
);

final kLTSubtitle = TextStyle(
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 122, 122, 122),
  fontSize: 14.0,
);
