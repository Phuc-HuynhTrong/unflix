import 'package:flutter/material.dart';
import 'package:unflix/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // Màu chính
          primaryColor: const Color(0xffF6C700),

          // Màu nền
          backgroundColor: Colors.black,

          // Màu của các indicator (đang không được select)
          indicatorColor: const Color(0xffC4C4C4).withOpacity(0.44),

          // Màu background của tile hoặc card trên nền đen
          cardColor: const Color(0xff121212),

          // Màu của dòng chữ phụ hoặc chữ trên nền background của cardColor.
          //hintColor: const Color(0xff9C9C9C),
          hintColor: const Color(0xff595959),
          fontFamily: 'Noto Sans'),
      home: Home(),
    );
  }
}
