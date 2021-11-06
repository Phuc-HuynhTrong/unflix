import 'package:flutter/material.dart';
import 'package:unflix/core/models/SuperIcon.dart';
import 'package:unflix/screens/search_screens/searched_screen.dart';

class SearchMainScreen extends StatefulWidget {
  const SearchMainScreen({Key? key}) : super(key: key);

  @override
  _SearchMainScreenState createState() => _SearchMainScreenState();
}

bool isSearched = false;
var align = MainAxisAlignment.center;

class _SearchMainScreenState extends State<SearchMainScreen> {
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
              print('click');
              setState(() {
                isSearched = !isSearched;
                if (align == MainAxisAlignment.center)
                  align = MainAxisAlignment.start;
                else
                  align = MainAxisAlignment.center;
              });
            },
            child: Container(
              height: 32,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: Color(0xff323232),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: align,
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
                  Text(
                    isSearched ? 'Fast and Furious' : 'Tìm kiếm',
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
            Container(
              height: size.height - 148,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
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
                                child: Image.asset(
                                    'assets/images/strangerthings.jpeg',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
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
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
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
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
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
                                child: Image.asset('assets/images/dhaakad.jpg',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
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
                                child: Image.asset('assets/images/mrrobot.png',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
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
            ),
          if (isSearched)
            Container(
              height: size.height - 148,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
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
                                child: Image.asset('assets/images/fast2.jpg',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset('assets/images/fast3.jpg',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
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
                                child: Image.asset('assets/images/fast4.jpg',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset('assets/images/fast5.jpg',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
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
                          child: Image.asset('assets/images/fast6.jpg',
                              width: (size.width - 20) / 1.05 * 0.7,
                              height: (size.width - 20) / 1.05,
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                                child: Image.asset('assets/images/fast8.jpg',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset('assets/images/fast9.jpg',
                                    width: ((size.width - 20) / 1.05 - 8) /
                                        2 *
                                        0.7,
                                    height: ((size.width - 20) / 1.05 - 8) / 2,
                                    fit: BoxFit.fill),
                              ),
                            ],
                          ),
                        )
                      ],
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
                    Text(
                      'Fast and slow \nSlow and Fast \nSlow and Serious \nFast and Faster',
                      style: TextStyle(color: Colors.white, height: 1.5),
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
