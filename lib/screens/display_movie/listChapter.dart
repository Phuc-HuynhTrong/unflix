import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unflix/screens/display_movie/display_movie_screen.dart';


class ListChapter extends StatefulWidget {
  final List<AssetImage> list;
  const ListChapter({Key? key, required this.list}) : super(key: key);

  @override
  _ListChapterState createState() => _ListChapterState();
}

class _ListChapterState extends State<ListChapter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => MaterialButton(
                  padding: EdgeInsets.only(top: 10, right: 12),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeLeft,
                                DeviceOrientation.landscapeRight
                              ]);
                                return DisplayMovieScreen(
                                  assetVideo:
                                  'assets/videos/THE-QUEEN_S-GAMBIT-Trailer-_2020_.mp4',
                                  isSingleFlim: false);
                            }));
                  },
                  child: Container(
                    height: 230,
                    width: 118,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 177,
                          width: 118,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  topLeft: Radius.circular(5)),
                              image: DecorationImage(
                                image: widget.list[index],
                                fit: BoxFit.fill,
                              )),
                        ),
                        Text(
                          "Tập ${index + 1}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
