import 'package:flutter/material.dart';

class ListPoster {
  List<AssetImage> listPopular =
  List.filled(10, AssetImage('assets/images/stpng.png'));
  List<AssetImage> listContinue =
  List.filled(10, AssetImage('assets/images/lovedeath.jpeg'));
  List<AssetImage> listUSUK =
  List.filled(10, AssetImage('assets/images/peakyblinders.jpg'));
  Data() {
    listUSUK[1] = AssetImage('assets/images/prisonbreak.png');
    listUSUK[2] = AssetImage('assets/images/mrrobot.png');
  }
}
