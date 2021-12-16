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
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 3,
              tabs: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Các tập',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Bộ sưu tập',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Nội dung tương tự',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Trailer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ]),
        ),
        Container(
          margin: EdgeInsets.all(0),
          height: 240,
          child: TabBarView(controller: _tabController, children: [
            Container(
            ),
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
