import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unflix/screens/film_information/listMovie.dart';
import 'package:unflix/screens/film_information/trailer_tab_screen.dart';

class BottomTapBar extends StatefulWidget {
  const BottomTapBar({Key? key}) : super(key: key);

  @override
  _BottomTapBarState createState() => _BottomTapBarState();
}

class _BottomTapBarState extends State<BottomTapBar>
    with TickerProviderStateMixin {
  int index = 1;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(0),
          child: TabBar(
              indicatorColor: Color(0xffF6C700),
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff939393),
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Các tập',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bộ sưu tập',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Nội dung tương tự',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Trailer',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
        Container(
          margin: EdgeInsets.all(0),
          height: 240,
          child: TabBarView(controller: _tabController, children: [
            Container(),
            Container(
              height: 180,
              child: ListMovie(),
            ),
            Container(
              height: 180,
              child: ListMovie(),
            ),
            Container(
              height: 240,
              child: TrailerTabScreen(),
            ),
          ]),
        )
      ],
    );
  }
}
