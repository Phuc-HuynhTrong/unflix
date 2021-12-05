import 'package:flutter/material.dart';
import 'package:unflix/core/models/SuperIcon.dart';

class InComingNewFeedScreen extends StatefulWidget {
  const InComingNewFeedScreen({Key? key}) : super(key: key);

  @override
  _InComingNewFeedScreenState createState() => _InComingNewFeedScreenState();
}

class Movie {
  var like;
  var releaseDate;
  var name;
  var thumbnailImg;
  var description;
  Movie(this.name, this.releaseDate, this.description, this.thumbnailImg,
      this.like);
}

var MovieList = [
  new Movie(
      "Tổng đài truy vết",
      "thứ 5",
      "Bị giáng cấp làm nhân viên tổng đài 911, vị thanh tra phiền muộn vật lộn để cứu một người gọi gặp nguy nan - trong một ngày u ám đầy những phát hiện và nhìn nhận.",
      "assets/images/horizontal1.jpg",
      "3.525"),
  new Movie(
      "Tổng đài truy vết",
      "thứ 5",
      "Bị giáng cấp làm nhân viên tổng đài 911, vị thanh tra phiền muộn vật lộn để cứu một người gọi gặp nguy nan - trong một ngày u ám đầy những phát hiện và nhìn nhận.",
      "assets/images/horizontal1.jpg",
      "3.525"),
  new Movie(
      "Tổng đài truy vết",
      "thứ 5",
      "Bị giáng cấp làm nhân viên tổng đài 911, vị thanh tra phiền muộn vật lộn để cứu một người gọi gặp nguy nan - trong một ngày u ám đầy những phát hiện và nhìn nhận.",
      "assets/images/horizontal1.jpg",
      "3.525"),
  new Movie(
      "Tổng đài truy vết",
      "thứ 5",
      "Bị giáng cấp làm nhân viên tổng đài 911, vị thanh tra phiền muộn vật lộn để cứu một người gọi gặp nguy nan - trong một ngày u ám đầy những phát hiện và nhìn nhận.",
      "assets/images/horizontal1.jpg",
      "3.525"),
  new Movie(
      "Tổng đài truy vết",
      "thứ 5",
      "Bị giáng cấp làm nhân viên tổng đài 911, vị thanh tra phiền muộn vật lộn để cứu một người gọi gặp nguy nan - trong một ngày u ám đầy những phát hiện và nhìn nhận.",
      "assets/images/horizontal1.jpg",
      "3.525"),
  new Movie(
      "Tổng đài truy vết",
      "thứ 5",
      "Bị giáng cấp làm nhân viên tổng đài 911, vị thanh tra phiền muộn vật lộn để cứu một người gọi gặp nguy nan - trong một ngày u ám đầy những phát hiện và nhìn nhận.",
      "assets/images/horizontal1.jpg",
      "3.525"),
  new Movie(
      "Tổng đài truy vết Tổng đài truy vết",
      "thứ 5",
      "Bị giáng cấp làm nhân viên tổng đài 911, vị thanh tra phiền muộn vật lộn để cứu một người gọi gặp nguy nan - trong một ngày u ám đầy những phát hiện và nhìn nhận.",
      "assets/images/horizontal1.jpg",
      "3.525"),
  new Movie(
      "Tổng đài truy vết",
      "thứ 5",
      "Bị giáng cấp làm nhân viên tổng đài 911, vị thanh tra phiền muộn vật lộn để cứu một người gọi gặp nguy nan - trong một ngày u ám đầy những phát hiện và nhìn nhận.",
      "assets/images/horizontal1.jpg",
      "3.525")
];

class _InComingNewFeedScreenState extends State<InComingNewFeedScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sắp ra mắt",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 18),
            child: Icon(
              Icons.cast,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(0),
        child: ListView(
          children: [
            for (int i = 0; i < MovieList.length; i++)
              Container(
                padding: EdgeInsets.only(top: 12, bottom: 24),
                child: Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(MovieList[i].thumbnailImg,
                            width: size.width,
                            height: size.width * 9 / 16,
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 12),
                                              child: SuperIcon(
                                                iconPath:
                                                    'assets/icons/heart-icon.svg',
                                                size: 24,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 12),
                                              child: SuperIcon(
                                                iconPath:
                                                    'assets/icons/message-icon.svg',
                                                size: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 6),
                                        child: Text(
                                          '${MovieList[i].like} lượt thích',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 6),
                                        child: Text(
                                          'Ra mắt vào ${MovieList[i].releaseDate}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: SuperIcon(
                                          iconPath:
                                              'assets/icons/bell-icon.svg',
                                          size: 24,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Nhắc tôi',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, bottom: 8),
                              child: Row(
                                children: [
                                  Container(
                                      child: Text(
                                    MovieList[i].name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 75,
                                    margin: EdgeInsets.only(left: 14),
                                    decoration: BoxDecoration(
                                        color: Color(0xff5CFF42),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Text(
                                      'Xem thêm',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                MovieList[i].description,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    height: 1.3),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
