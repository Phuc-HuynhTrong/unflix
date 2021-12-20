import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendQuestionScreen extends StatefulWidget {
  const SendQuestionScreen({Key? key}) : super(key: key);

  @override
  _SendQuestionScreenState createState() => _SendQuestionScreenState();
}

class _SendQuestionScreenState extends State<SendQuestionScreen> {
  // Biến thể hiện trạng thái có đang gửi hay không
  bool isSending = false;
  // Nội dung của phần góp ý


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        leading: const CloseButton(
          color: Colors.white,
        ),
        title: const Text(
          'Gửi mail cho nhà phát hành',
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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //width: MediaQuery.of(context).size.width ,
                backgroundColor: Color(0xffF6C700),
                content: Text(
                  "Đang gửi thư...",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                duration: Duration(milliseconds: 1500),
              ));
              Future.delayed(Duration(milliseconds: 1500), (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //width: MediaQuery.of(context).size.width ,
                  backgroundColor: Color(0xffF6C700),
                  content: Text(
                    "Gửi thư thành công",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(milliseconds: 1200),
                ));
              });
              Future.delayed(Duration(milliseconds: 2000), (){
                Navigator.pop(context);
              });
            },
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: const Center(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      // Nếu đang gửi thì sẽ hiển thị xoay xoay
      body: isSending
          ? Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      )
      // Nếu không phải đang gửi thì hiển thị giao diện chính gồm 2 text form field
          : Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            // Nhập tiêu đề tại đây
            TextFormField(
              onChanged: (val) {
              },
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              cursorColor: CupertinoColors.white,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  hintText: "Tiêu đề",
                  hintStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 10,
            ),
            // Nhập nội dung tại đây
            TextFormField(
              onChanged: (val) {
              },
              maxLines: 100,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Nhập tin nhắn cụa bạn",
                  hintStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400)),
            )
          ],
        ),
      ),
    );
  }

}