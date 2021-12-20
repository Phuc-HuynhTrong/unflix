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
            'Liên hệ tổng đài',
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
            Center(
              child: SizedBox(
                height: size.width / 3.5,
                width: size.width / 3.5,
                child: Image.asset(
                  'assets/icons/icon1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Center(
              child: Text(
                "\nTổng đài Unflix",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "19520000",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Ấn vào hình điện thoại",
                  style: TextStyle(color: Colors.white60, fontSize: 15),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 3),
                child: const Text(
                  "ở góc trên bên phải để gọi",
                  style: TextStyle(color: Colors.white60, fontSize: 15),
                ),
              ),
            ),
          ],
        ));
  }
}
