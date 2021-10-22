import 'package:flutter/material.dart';
import 'package:unflix/style/text_style.dart';
class MainPoster extends StatelessWidget {
  const MainPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInApp textInApp = TextInApp();
    return Container(
        height: 550,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/PosterGambitHau.jpeg'),
              fit: BoxFit.fill,
            )),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text('Danh sach',
                          style: textInApp.subtitle(
                              Colors.white, context)),
                    ],
                  )),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 40,
                    width: 86,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.play_circle_fill,
                          color: Colors.black,
                        ),
                        Text(' Phat',
                            style: textInApp.subtitle(
                                Colors.black, context)),
                      ],
                    ),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                      Text('Thong tin',
                          style: textInApp.subtitle(
                              Colors.white, context)),
                    ],
                  ))
            ],
          ),
        ));
  }
}
