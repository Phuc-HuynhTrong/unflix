import 'package:flutter/material.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';

class ListScrollPoster extends StatefulWidget {
  final List<AssetImage> list;
  const ListScrollPoster({Key? key, required this.list}) : super(key: key);

  @override
  _ListScrollPosterState createState() => _ListScrollPosterState();
}

class _ListScrollPosterState extends State<ListScrollPoster> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 167,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => MaterialButton(
                  padding: EdgeInsets.only(right: 12),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FilmInformationScreen()));
                  },
                  child: Container(
                    //margin: EdgeInsets.only(right: 12),
                    height: 167,
                    width: 118,
                    child: Container(
                      height: 167,
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
                  ),
                )));
  }
}
