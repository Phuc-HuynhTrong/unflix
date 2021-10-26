import 'package:flutter/material.dart';
import 'package:unflix/core/data/ListInformationFilm.dart';

class ScoreRow extends StatefulWidget {
  const ScoreRow({Key? key}) : super(key: key);

  @override
  _ScoreRowState createState() => _ScoreRowState();
}

class _ScoreRowState extends State<ScoreRow> {
  ListMovie listMovie = ListMovie();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(1),
              margin: EdgeInsets.only(left: 0, right: 10),
              width: 23,
              height: 11,
              decoration: BoxDecoration(
                color: Color(0xffF6C700),
              ),
              child: Text(
                'IMDb',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Text(
              listMovie.listMovie[0].imdbScore.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              '/10 ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            Icon(
              Icons.star,
              color: Color(0xffF6C700),
              size: 11,
            )
          ],
        ),
        Row(
          children: [
            Container(
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(left: 0, right: 10),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  color: Color(0xffF6C700),
                ),
                child: Image.asset(
                  'assets/images/tomatoes.png',
                  fit: BoxFit.fill,
                )),
            Text(
              listMovie.listMovie[0].tomatoesScore.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              '%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 80),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(1),
                  margin: EdgeInsets.only(left: 0, right: 10),
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    color: Color(0xffF6C700),
                  ),
                  child: Image.asset(
                    'assets/images/m.png',
                    fit: BoxFit.fill,
                  )),
              Container(
                padding: EdgeInsets.all(1),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  color: Color(0xff66CC33),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(
                    listMovie.listMovie[0].mScore.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
