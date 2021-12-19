import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';

Widget MenuButton(BuildContext context) {
  return PopupMenuButton(
    elevation: 100,
      child: const Icon(
        Icons.more_vert_rounded,
        color: Colors.white,
      ),
      onSelected: (int v){
        if(v == 1){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FilmInformationScreen()));
        }
      },
      itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //width: MediaQuery.of(context).size.width ,
                  backgroundColor: Color(0xffF6C700),
                  content: Text(
                    "Đã thêm vào danh sách",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ));
              },
              child: const Text(
                "Thêm vào danh sách",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: const Text(
                "Xem thông tin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ]);
}
