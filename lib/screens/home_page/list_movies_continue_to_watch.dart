import 'package:flutter/material.dart';

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
            scrollDirection: Axis.horizontal,
            itemCount: 10,
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
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle_outline_rounded,
                              color: Colors.white,
                              size: 80,
                            )),
                      ),
                      Container(
                        height: 36,
                        width: 118,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.error_outline,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.align_horizontal_right,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
