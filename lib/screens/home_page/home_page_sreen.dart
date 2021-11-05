import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unflix/core/data/listposter.dart';
import 'package:unflix/screens/home_page/list_movies_continue_to_watch.dart';
import 'package:unflix/screens/home_page/list_poster_film.dart';
import 'package:unflix/screens/home_page/main_poster.dart';
import 'package:unflix/style/text_style.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool isFilm = false;
  bool isGeneral = true;
  @override
  Widget build(BuildContext context) {
    TextInApp textInApp = TextInApp();
    ListPoster listPoster = ListPoster();
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            children: [
              isFilm
                  ? MainPoster(
                      listPoster: listPoster.listFilm,
                    )
                  : isGeneral
                      ? MainPoster(
                          listPoster: listPoster.listMainPoster,
                        )
                      : MainPoster(
                          listPoster: listPoster.listTvSeries,
                        ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.cast,
                              color: Colors.white,
                              size: 30,
                            )),
                      ],
                    ),
                    isGeneral
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isGeneral = false;
                                    isFilm = false;
                                  });
                                },
                                child: Text(
                                  'Phim tr.hình',
                                  style: textInApp.headline6(
                                      Colors.white, context),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isGeneral = false;
                                    isFilm = true;
                                  });
                                },
                                child: Text(
                                  'Phim',
                                  style: textInApp.headline6(
                                      Colors.white, context),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: PopupMenuButton(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Thể loại',
                                          style: textInApp.headline6(
                                              Colors.white, context),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    itemBuilder: (context) => [
                                          PopupMenuItem<int>(
                                            value: 0,
                                            child: Text(
                                              "Anime",
                                              style: textInApp.headline6(
                                                  Colors.white, context),
                                            ),
                                          ),
                                          PopupMenuItem<int>(
                                            value: 1,
                                            child: Text(
                                              "Viễn tưởng",
                                              style: textInApp.headline6(
                                                  Colors.white, context),
                                            ),
                                          ),
                                          PopupMenuItem<int>(
                                            value: 2,
                                            child: Text(
                                              "Tình cảm",
                                              style: textInApp.headline6(
                                                  Colors.white, context),
                                            ),
                                          ),
                                          PopupMenuItem<int>(
                                            value: 3,
                                            child: Text(
                                              "Phiêu lưu",
                                              style: textInApp.headline6(
                                                  Colors.white, context),
                                            ),
                                          ),
                                          PopupMenuItem<int>(
                                            value: 4,
                                            child: Text(
                                              "Kinh dị",
                                              style: textInApp.headline6(
                                                  Colors.white, context),
                                            ),
                                          ),
                                          PopupMenuItem<int>(
                                            value: 5,
                                            child: Text(
                                              "Phim ma",
                                              style: textInApp.headline6(
                                                  Colors.white, context),
                                            ),
                                          ),
                                        ]),
                              )
                            ],
                          )
                        : isFilm
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MaterialButton(
                                    onPressed: () {},
                                    child: PopupMenuButton(
                                      initialValue: 1,
                                      child: Row(children: [
                                        Text(
                                          'Phim',
                                          style: textInApp.headline6(
                                              Colors.white, context),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        )
                                      ]),
                                      itemBuilder: (context) => [
                                        PopupMenuItem<int>(
                                          value: 0,
                                          child: Text(
                                            "Trang chủ",
                                            style: textInApp.headline6(
                                                Colors.white, context),
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 1,
                                          child: Text(
                                            "Phim",
                                            style: textInApp.headline6(
                                                Colors.white, context),
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 2,
                                          child: Text(
                                            "Phim truyền hình",
                                            style: textInApp.headline6(
                                                Colors.white, context),
                                          ),
                                        ),
                                      ],
                                      onSelected: (index) {
                                        setState(() {
                                          if (index == 0) {
                                            isFilm = false;
                                            isGeneral = true;
                                          } else if (index == 1) {
                                            isFilm = true;
                                            isGeneral = false;
                                          } else {
                                            isFilm = false;
                                            isGeneral = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: PopupMenuButton(
                                        child: Row(
                                          children: [
                                            Text(
                                              'Thê loại',
                                              style: textInApp.headline6(
                                                  Colors.white, context),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        itemBuilder: (context) => [
                                              PopupMenuItem<int>(
                                                value: 0,
                                                child: Text(
                                                  "Anime",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 1,
                                                child: Text(
                                                  "Viễn tưởng",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 2,
                                                child: Text(
                                                  "Tình cảm",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 3,
                                                child: Text(
                                                  "Phiêu lưu",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 4,
                                                child: Text(
                                                  "Kinh dị",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 5,
                                                child: Text(
                                                  "Phim ma",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                            ]),
                                  )
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MaterialButton(
                                    onPressed: () {},
                                    child: PopupMenuButton(
                                      initialValue: 2,
                                      child: Row(children: [
                                        Text(
                                          'Phim truyền hình',
                                          style: textInApp.headline6(
                                              Colors.white, context),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        )
                                      ]),
                                      itemBuilder: (context) => [
                                        PopupMenuItem<int>(
                                          value: 0,
                                          child: Text(
                                            "Trang chủ",
                                            style: textInApp.headline6(
                                                Colors.white, context),
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 1,
                                          child: Text(
                                            "Phim",
                                            style: textInApp.headline6(
                                                Colors.white, context),
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 2,
                                          child: Text(
                                            "Phim truyền hình",
                                            style: textInApp.headline6(
                                                Colors.white, context),
                                          ),
                                        ),
                                      ],
                                      onSelected: (index) {
                                        setState(() {
                                          if (index == 0) {
                                            isFilm = false;
                                            isGeneral = true;
                                          } else if (index == 1) {
                                            isFilm = true;
                                            isGeneral = false;
                                          } else {
                                            isFilm = false;
                                            isGeneral = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: PopupMenuButton(
                                        child: Row(
                                          children: [
                                            Text(
                                              'Thể loại',
                                              style: textInApp.headline6(
                                                  Colors.white, context),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        itemBuilder: (context) => [
                                              PopupMenuItem<int>(
                                                value: 0,
                                                child: Text(
                                                  "Anime",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 1,
                                                child: Text(
                                                  "Viễn tưởng",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 2,
                                                child: Text(
                                                  "Tình cảm",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 3,
                                                child: Text(
                                                  "Phiêu lưu",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 4,
                                                child: Text(
                                                  "Kinh dị",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 5,
                                                child: Text(
                                                  "Phim ma",
                                                  style: textInApp.headline6(
                                                      Colors.white, context),
                                                ),
                                              ),
                                            ]),
                                  )
                                ],
                              ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 243,
            margin: EdgeInsets.only(left: 10, right: 5),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Danh sách tiếp tục xem của bạn',
                        style: textInApp.headline6(Colors.white, context),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                ListMovieContinueToWatch(
                  list: listPoster.listContinue,
                ),
              ],
            ),
          ),
          Container(
            height: 203,
            margin: EdgeInsets.only(left: 10, right: 5),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Phim đang thịnh hành',
                        style: textInApp.headline6(Colors.white, context),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                ListScrollPoster(
                  list: listPoster.listPopular,
                ),
              ],
            ),
          ),
          Container(
            height: 203,
            margin: EdgeInsets.only(left: 10, right: 5),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Chương trình truyền hình Âu-Mỹ',
                        style: textInApp.headline6(Colors.white, context),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                ListScrollPoster(
                  list: listPoster.listUSUK,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
