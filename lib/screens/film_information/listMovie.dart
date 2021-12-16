import 'package:flutter/material.dart';
class ListMovie extends StatefulWidget {
  const ListMovie({Key? key}) : super(key: key);
  @override
  _ListMovieState createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 167,
              width: 117,
              child: Container(
                height: 167,
                width: 117,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/stpng.png'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 167,
              width: 117,
              child: Container(
                height: 167,
                width: 118,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/lovedeath.jpeg'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 167,
              width: 118,
              child: Container(
                height: 167,
                width: 117,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/prisonbreak.png'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
