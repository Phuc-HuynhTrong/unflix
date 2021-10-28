import 'package:flutter/material.dart';

class TextInApp {
  TextStyle subtitle(Color color, BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!.copyWith(color: color);
  }

  TextStyle headline5(Color color, BuildContext context) {
    return Theme.of(context).textTheme.headline5!.copyWith(color: color);
  }

  TextStyle headline6(Color color, BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(color: color);
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
