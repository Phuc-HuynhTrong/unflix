import 'package:flutter/material.dart';

class ListPoster {
  List<AssetImage> listPopular =
      List.filled(10, AssetImage('assets/images/stpng.png'));
  List<AssetImage> listContinue =
      List.filled(10, AssetImage('assets/images/lovedeath.jpeg'));
  List<AssetImage> listUSUK =
      List.filled(10, AssetImage('assets/images/peakyblinders.jpg'));
  List<MainPosterModel> listMainPoster = [];
  ListPoster() {
    listUSUK[1] = AssetImage('assets/images/prisonbreak.png');
    listUSUK[2] = AssetImage('assets/images/mrrobot.png');
    listMainPoster.add(MainPosterModel(
        'GAMBIT HẬU',
        AssetImage('assets/images/PosterGambitHau.jpeg'),
        'Kìa con bướm vàng, kìa con bướm vàng',
        8.6));
    listMainPoster.add(MainPosterModel(
        'PRISON BREAK',
        AssetImage('assets/images/prisonbreak.png'),
        'Xòe đôi cánh, xòe đôi cánh',
        6.7));
    listMainPoster.add(MainPosterModel(
        'MR.ROBOT',
        AssetImage('assets/images/mrrobot.png'),
        'Bướm bướm bay đôi ba vòng',
        7.5));
  }
}

class MainPosterModel {
  late String name;
  late String description;
  late AssetImage poster;
  late double imdb;
  MainPosterModel(
      String name, AssetImage poster, String description, double imdb) {
    this.name = name;
    this.description = description;
    this.poster = poster;
    this.imdb = imdb;
  }
}

List<AssetImage> favouriteList =
    List.filled(10, AssetImage('assets/images/stpng.png'));
