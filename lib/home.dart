import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unflix/screens/home_page/home_page_sreen.dart';
import 'package:unflix/screens/search_screens/search_main_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  void onTapedTap(int id) {
    setState(() {
      index = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: index == 0
              ? HomePageScreen()
              : index == 1
                  ? Container()
                  : index == 2
                      ? SearchMainScreen()
                      : Container(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                label: "Trang chủ",
                icon: Icon(
                  Icons.water_damage_outlined,
                  size: 30,
                  //color: Colors.white,
                )),
            BottomNavigationBarItem(
                label: "Sắp ra mắt",
                icon: Icon(
                  Icons.upcoming,
                  size: 30,
                  // color: Colors.white,
                )),
            BottomNavigationBarItem(
                label: "Tìm kiếm",
                icon: Icon(
                  Icons.search,
                  size: 30,
                  //color: Colors.white,
                )),
            BottomNavigationBarItem(
                label: "Tệp tải xuống",
                icon: Icon(
                  Icons.download,
                  size: 30,
                  //color: Colors.white,
                )),
          ],
          currentIndex: index,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[500],
          onTap: onTapedTap,
        ));
  }
}
