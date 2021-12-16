import 'package:flutter/material.dart';

class ListPoster {
  List<MainPosterModel> listFilm = [];
  List<MainPosterModel> listTvSeries =[];
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
    listFilm.add(MainPosterModel(
        'BỐ GIÀ',
        AssetImage('assets/images/bogia.jpg'),
        'Big city, big city boi',
        8.6));
    listFilm.add(MainPosterModel(
        'Mắc biếc',
        AssetImage('assets/images/matbiec.jpg'),
        'Thả tim đầy story em',
        6.7));
    listFilm.add(MainPosterModel(
        'PRISON BREAK',
        AssetImage('assets/images/prisonbreak.png'),
        'Xòe đôi cánh, xòe đôi cánh',
        6.7));
    listTvSeries.add(MainPosterModel(
        'NGƯỜI PHAN XỬ',
        AssetImage('assets/images/nguoiphanxu.jpg'),
        'Trói em bằng cà vạt',
        8.6));
    listTvSeries.add(MainPosterModel(
        'VỀ NHÀ ĐI CON',
        AssetImage('assets/images/venhadicon.png'),
        'Penhouse trên Đà Lạt',
        6.7));
    listTvSeries.add(MainPosterModel(
        'GAMBIT HẬU',
        AssetImage('assets/images/PosterGambitHau.jpeg'),
        'Kìa con bướm vàng',
        6.7));
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
