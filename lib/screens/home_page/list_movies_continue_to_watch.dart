import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unflix/core/models/SuperIcon.dart';
import 'package:unflix/screens/display_movie/display_movie_screen.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';
import 'package:unflix/screens/home_page/menubutton.dart';

class ListMovieContinueToWatch extends StatefulWidget {
  final List<AssetImage> list;
  const ListMovieContinueToWatch({Key? key, required this.list})
      : super(key: key);

  @override
  _ListMovieContinueToWatch createState() => _ListMovieContinueToWatch();
}

class _ListMovieContinueToWatch extends State<ListMovieContinueToWatch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 207,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: widget.list.length,
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 12),
                  height: 207,
                  width: 118,
                  child: Column(
                    children: [
                      Container(
                        height: 171,
                        width: 118,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5)),
                            image: DecorationImage(
                              image: widget.list[index],
                              fit: BoxFit.fill,
                            )),
                        child: IconButton(
                            onPressed: () async {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeLeft,
                                DeviceOrientation.landscapeRight
                              ]);
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DisplayMovieScreen(
                                            assetVideo:
                                                'assets/videos/TopGun.mp4',
                                            isSingleFlim: false,
                                          )));
                            },
                            icon: SuperIcon(
                              iconPath: 'assets/icons/PlayCircle.svg',
                              size: 68,
                            ),),
                      ),
                      Stack(
                        children: [
                          Container(
                            color: Color(0xff262626),
                            height: 4,
                            width: 118,
                          ),
                          Container(
                            color: Color(0xFFF6C700),
                            height: 4,
                            width: 100,
                          ),
                        ],
                      ),
                      Container(
                        height: 32,
                        width: 118,
                        decoration: BoxDecoration(
                          color: Color(0xff191919),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FilmInformationScreen()));
                                },
                                icon: const Icon(
                                  Icons.info_outline_rounded,
                                  color: Color(0xffB2B2B2),
                                  size: 18,
                                ),),
                            MenuButton(context),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
