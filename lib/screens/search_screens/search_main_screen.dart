import 'package:flutter/material.dart';
import 'package:unflix/core/models/SuperIcon.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';
import 'package:unflix/screens/search_screens/searched_screen.dart';

class SearchMainScreen extends StatefulWidget {
  const SearchMainScreen({Key? key}) : super(key: key);

  @override
  _SearchMainScreenState createState() => _SearchMainScreenState();
}

bool isSearched = false;

class _SearchMainScreenState extends State<SearchMainScreen> {
  bool selected = false;
  String seachString = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(8, 30, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Container(
              height: 40,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: Color(0xff323232),
                  borderRadius: BorderRadius.circular(5)),
              child: AnimatedAlign(
                alignment: selected ? Alignment.topLeft : Alignment.center,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: FittedBox(
                  //width: !selected ? 150 : size.width - 30,
                  //height: 32,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SuperIcon(
                        iconPath: 'assets/icons/search-icon.svg',
                        size: 18,
                        color: Color(0xff323232),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 40,
                        width: !selected ? 100 : size.width+100,
                        child: TextFormField(
                          cursorColor: Colors.white,
                          enabled: selected ? true : false,
                          autofocus: selected ? true : false,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                seachString == "" ? "Tìm kiếm" : seachString,
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(12, 18, 12, 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            fillColor: selected
                                ? Color(0xff2B2B2B)
                                : Color(0xff323232),
                          ),
                          onChanged: (val) {
                            setState(() {
                              seachString = val;
                              isSearched = true;
                              if (val == "" || val == null) {
                                isSearched = false;
                                selected = false;
                              }
                              //selected = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              isSearched
                  ? 'Phim và chương trình truyền hình'
                  : 'Tìm kiếm hàng đầu',
              style: TextStyle(
                  color: Color(0xffe7e7e7),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          if (!isSearched)
            Expanded(
              //height: size.height - 168,
              child: ListView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.zero,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilmInformationScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                                'assets/images/peakyblinders.jpg',
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
                                  child: Image.asset(
                                      'assets/images/strangerthings.jpeg',
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
                                      fit: BoxFit.fill),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                      'assets/images/PosterGambitHau.jpeg',
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
                                      fit: BoxFit.fill),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilmInformationScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
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
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
                                      fit: BoxFit.fill),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset('assets/images/1.jpg',
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilmInformationScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
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
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
                                      fit: BoxFit.fill),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset('assets/images/6.jpg',
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
                                      fit: BoxFit.fill),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilmInformationScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
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
                                  child: Image.asset(
                                      'assets/images/dhaakad.jpg',
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
                                      fit: BoxFit.fill),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset('assets/images/k.jpg',
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
                                      fit: BoxFit.fill),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilmInformationScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                      'assets/images/mrrobot.png',
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
                                      fit: BoxFit.fill),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset('assets/images/stpng.png',
                                      width: ((size.width - 20) / 1.05 - 8) /
                                          2 *
                                          0.7,
                                      height:
                                          ((size.width - 20) / 1.05 - 8) / 2,
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
                    ),
                  )
                ],
              ),
            ),
          if (isSearched)
            Expanded(
              child: Container(
                height: size.height - 168,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilmInformationScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset('assets/images/fast1.jpg',
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
                                    child: Image.asset(
                                        'assets/images/fast2.jpg',
                                        width: ((size.width - 20) / 1.05 - 8) /
                                            2 *
                                            0.7,
                                        height:
                                            ((size.width - 20) / 1.05 - 8) / 2,
                                        fit: BoxFit.fill),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                        'assets/images/fast3.jpg',
                                        width: ((size.width - 20) / 1.05 - 8) /
                                            2 *
                                            0.7,
                                        height:
                                            ((size.width - 20) / 1.05 - 8) / 2,
                                        fit: BoxFit.fill),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilmInformationScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                        'assets/images/fast4.jpg',
                                        width: ((size.width - 20) / 1.05 - 8) /
                                            2 *
                                            0.7,
                                        height:
                                            ((size.width - 20) / 1.05 - 8) / 2,
                                        fit: BoxFit.fill),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                        'assets/images/fast5.jpg',
                                        width: ((size.width - 20) / 1.05 - 8) /
                                            2 *
                                            0.7,
                                        height:
                                            ((size.width - 20) / 1.05 - 8) / 2,
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
                              child: Image.asset('assets/images/fast6.jpg',
                                  width: (size.width - 20) / 1.05 * 0.7,
                                  height: (size.width - 20) / 1.05,
                                  fit: BoxFit.fill),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilmInformationScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset('assets/images/fast7.jpg',
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
                                    child: Image.asset(
                                        'assets/images/fast8.jpg',
                                        width: ((size.width - 20) / 1.05 - 8) /
                                            2 *
                                            0.7,
                                        height:
                                            ((size.width - 20) / 1.05 - 8) / 2,
                                        fit: BoxFit.fill),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                        'assets/images/fast9.jpg',
                                        width: ((size.width - 20) / 1.05 - 8) /
                                            2 *
                                            0.7,
                                        height:
                                            ((size.width - 20) / 1.05 - 8) / 2,
                                        fit: BoxFit.fill),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    if (isSearched)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "Khám phá phim và chương trình liên quan đến",
                          style: TextStyle(
                              color: Color(0xffe7e7e7),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    if (isSearched)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                seachString = 'Fast and slow';
                              });
                            },
                            child: Text(
                              'Fast and slow',
                              style:
                                  TextStyle(color: Colors.white, height: 1.5),
                            ),
                          ),
                          Text(
                            'Slow and Fast',
                            style: TextStyle(color: Colors.white, height: 1.5),
                          ),
                          Text(
                            'Slow and Serious',
                            style: TextStyle(color: Colors.white, height: 1.5),
                          ),
                          Text(
                            'Fast and Faster',
                            style: TextStyle(color: Colors.white, height: 1.5),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
