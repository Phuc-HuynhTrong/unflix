import 'package:flutter/material.dart';

class ListPoster {

  List<MainPosterModel> listMainPoster = [
    MainPosterModel(
        'GAMBIT HẬU',
        const AssetImage('assets/images/PosterGambitHau.jpeg'),
        'Chính kịch, Trí tuệ, Xúc động',
        8.6),
    MainPosterModel(
        'PRISON BREAK',
        const AssetImage('assets/images/prisonbreak.png'),
        'Tội phạm, Hành động, Giật gân',
        8.3),
    MainPosterModel(
        'US',
        const AssetImage('assets/images/us.jpg'),
        'Tâm lý, Kinh dị, Giật gân',
        6.8),
  ];
  List<MainPosterModel> listFilm = [
    MainPosterModel(
        'US',
        const AssetImage('assets/images/us.jpg'),
        'Tâm lý, Kinh dị, Giật gân',
        6.8),
    MainPosterModel(
        'JOHN WICK 2',
        const AssetImage('assets/images/johnwick.jpg'),
        'Hành động, Tội phạm, Giật gân',
        7.5),
    MainPosterModel(
        'VENOM 2',
        const AssetImage('assets/images/venom_2.jpeg'),
        'Hành động, Kinh dị, Giật gân',
        6.0),
  ];
  List<MainPosterModel> listTvSeries =[
    MainPosterModel(
        'GAMBIT HẬU',
        const AssetImage('assets/images/PosterGambitHau.jpeg'),
        'Chính kịch, Trí tuệ, Xúc động',
        8.6),
    MainPosterModel(
        'PRISON BREAK',
        const AssetImage('assets/images/prisonbreak.png'),
        'Tội phạm, Hành động, Giật gân',
        8.3),
    MainPosterModel(
        'BILLIONS',
        const AssetImage('assets/images/billions.jpg'),
        'Chính kịch',
        8.4),
  ];
  List<AssetImage> listPopular = [
    const AssetImage('assets/images/1.jpg'),
    const AssetImage('assets/images/2.jpg'),
    const AssetImage('assets/images/3.jpg'),
    const AssetImage('assets/images/5.jpg'),
    const AssetImage('assets/images/6.jpg'),
    const AssetImage('assets/images/9.jpg'),
  ];
  List<AssetImage> listContinue = [
    const AssetImage('assets/images/venom.jpeg'),
    const AssetImage('assets/images/strangerthings.jpeg'),
    const AssetImage('assets/images/thetomorrowwar.jpg'),
    const AssetImage('assets/images/trangquynh.jpg'),
    const AssetImage('assets/images/trangti.jpg'),
    const AssetImage('assets/images/venom.jpeg'),
    const AssetImage('assets/images/strangerthings.jpeg'),
    const AssetImage('assets/images/thetomorrowwar.jpg'),
    const AssetImage('assets/images/trangquynh.jpg'),
    const AssetImage('assets/images/trangti.jpg'),
  ];
  List<AssetImage> listContinue2 = [
    const AssetImage('assets/images/spiderman.png'),
    const AssetImage('assets/images/phimgiday.png'),
    const AssetImage('assets/images/venom.png'),
    const AssetImage('assets/images/wibu1.png'),
    const AssetImage('assets/images/wibu2.png'),
    const AssetImage('assets/images/venom.jpeg'),
    const AssetImage('assets/images/strangerthings.jpeg'),
    const AssetImage('assets/images/thetomorrowwar.jpg'),
    const AssetImage('assets/images/trangquynh.jpg'),
    const AssetImage('assets/images/trangti.jpg'),
  ];
  List<AssetImage> listUSUK = [
    const AssetImage('assets/images/mrrobot.png'),
    const AssetImage('assets/images/lovedeath.jpeg'),
    const AssetImage('assets/images/strangerthings.jpeg'),
  ];

  ListPoster() {
    // listUSUK[1] = AssetImage('assets/images/prisonbreak.png');
    // listUSUK[2] = AssetImage('assets/images/mrrobot.png');
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
