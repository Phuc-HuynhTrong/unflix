import 'package:flutter/material.dart';
import 'package:unflix/core/models/SuperIcon.dart';
import 'package:unflix/screens/search_screens/searched_screen.dart';

class SearchMainScreen extends StatefulWidget {
  const SearchMainScreen({Key? key}) : super(key: key);

  @override
  _SearchMainScreenState createState() => _SearchMainScreenState();
}

class _SearchMainScreenState extends State<SearchMainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(8, 15, 8, 0),
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                  color: Color(0xff323232),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SuperIcon(
                    iconPath: 'assets/icons/search-icon.svg',
                    size: 18,
                    color: Color(0xff323232),
                  ),
                  Text(
                    'Tìm kiếm',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Color(0xFF7c7c7c)),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              'Tìm kiếm hàng đầu',
              style: TextStyle(
                  color: Color(0xffe7e7e7),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/peakyblinders.jpg',
                      width: (size.width - 20) / 1.05 * 0.7,
                      height: (size.width - 20) / 1.05,
                      fit: BoxFit.fill),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/strangerthings.jpeg',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/PosterGambitHau.jpeg',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/venom.jpeg',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/1.jpg',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/2.jpg',
                      width: (size.width - 20) / 1.05 * 0.7,
                      height: (size.width - 20) / 1.05,
                      fit: BoxFit.fill),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/3.jpg',
                      width: (size.width - 20) / 1.05 * 0.7,
                      height: (size.width - 20) / 1.05,
                      fit: BoxFit.fill),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/5.jpg',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/6.jpg',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/9.jpg',
                      width: (size.width - 20) / 1.05 * 0.7,
                      height: (size.width - 20) / 1.05,
                      fit: BoxFit.fill),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/dhaakad.jpg',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/k.jpg',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/mrrobot.png',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/stpng.png',
                            width: ((size.width - 20) / 1.05 - 8) / 2 * 0.7,
                            height: ((size.width - 20) / 1.05 - 8) / 2,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/wrongturn.jpg',
                      width: (size.width - 20) / 1.05 * 0.7,
                      height: (size.width - 20) / 1.05,
                      fit: BoxFit.fill),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
