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
        primaryColor: const Color(0xffF6C700),
        backgroundColor: Colors.black,
        //hintColor: const Color(0xff9C9C9C),
        hintColor: const Color(0xff595959),
        indicatorColor: const Color(0xffC4C4C4).withOpacity(0.44),
        cardColor: const Color(0xff121212),
        fontFamily: 'Noto Sans'
      ),
      home: Home(),
    );
  }
}
