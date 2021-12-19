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
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            width: size.width * 0.22,
            height: size.height * 0.5,
            margin: EdgeInsets.only(right: 18, top: size.height*0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  padding: EdgeInsets.only(top: 10, right: 12),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
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
                    width: size.width * 0.22,
                    height: size.width * 0.22 * 9 / 16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        image: DecorationImage(
                          image: widget.list[index],
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                  child: Text(
                    "Tập ${index + 1} ",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Text(
                  "Ba thương con thì con giống mẹ, mẹ thương con thì con giống ba",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
