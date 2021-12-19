import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Trợ giúp và Hỗ trợ",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
              color: const Color(0xff121212),
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset('assets/icons/icon1.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Trung tâm trợ giúp",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
              color: const Color(0xff121212),
              height: 50,
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset('assets/icons/icon2.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Hộp thư hỗ trợ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
              color: const Color(0xff121212),
              height: 50,
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset('assets/icons/icon3.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Báo cáo sự cố",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
              color: const Color(0xff121212),
              height: 50,
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset('assets/icons/icon4.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Điều khoản và chính sách",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
