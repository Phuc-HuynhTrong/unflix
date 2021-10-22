import 'package:flutter/material.dart';
class TextInApp {
  TextStyle subtitle(Color color, BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .subtitle2!
        .copyWith(color: color);
  }
  TextStyle headline5(Color color, BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .headline5!
        .copyWith(color: color);
  }
  TextStyle headline6(Color color, BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .headline6!
        .copyWith(color: color);
  }
}