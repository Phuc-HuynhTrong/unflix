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
              MainPoster(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed:(){},
                          child: Text(
                            'Phim tr.hình',
                            style: textInApp.headline6(Colors.white, context),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: Text(
                            'Phim',
                            style: textInApp.headline6(Colors.white, context),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        MaterialButton(
                          onPressed: (){},
                          child: PopupMenuButton(
                              child: Row(
                                children: [
                                  Text(
                                    'The loai',
                                    style: textInApp.headline6(
                                        Colors.white, context),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              color: Colors.transparent,
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
                                    "Vien tuong",
                                    style: textInApp.headline6(
                                        Colors.white, context),
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 2,
                                  child: Text(
                                    "Tinh cam",
                                    style: textInApp.headline6(
                                        Colors.white, context),
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 3,
                                  child: Text(
                                    "Phieu luu",
                                    style: textInApp.headline6(
                                        Colors.white, context),
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 4,
                                  child: Text(
                                    "Kinh di",
                                    style: textInApp.headline6(
                                        Colors.white, context),
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 5,
                                  child: Text(
                                    "Phim truyen hinh",
                                    style: textInApp.headline6(
                                        Colors.white, context),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    )
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
