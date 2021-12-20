import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  _HelpCenter createState() => _HelpCenter();
}

class _HelpCenter extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          leading: const CloseButton(
            color: Colors.white,
          ),
          title: const Text(
            'Trung tâm trợ giúp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
              // Button ấn nút gửi
              onTap: () async {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: const Center(
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        // Nếu đang gửi thì sẽ hiển thị xoay xoay
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "\nLiên hệ tổng đài:",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      'assets/icons/icon1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "19520000",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Hoặc truy cập vào:  ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Text(
                    "trungtamtrogiupunflix.com.vn",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  const Text(
                    "để được giúp đỡ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Ấn vào hình điện thoại ở góc trên",
                  style: TextStyle(color: Colors.white60, fontSize: 15),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 3, bottom: 30),
                child: const Text(
                  " bên phải để gọi cho tổng đài",
                  style: TextStyle(color: Colors.white60, fontSize: 15),
                ),
              ),
            ),
          ],
        ));
  }
}
