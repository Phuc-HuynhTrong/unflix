import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ReportIssue extends StatefulWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  _ReportIssueState createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  List<bool> listSeleted = List.filled(10, false);
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
            'Báo cáo sự cố',
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
                    "Đang gửi báo cáo...",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(milliseconds: 1500),
                ));
                Future.delayed(Duration(milliseconds: 1500), () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //width: MediaQuery.of(context).size.width ,
                    backgroundColor: Color(0xffF6C700),
                    content: Text(
                      "Gửi báo cáo sự cố thành công",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(milliseconds: 1200),
                  ));
                });
                Future.delayed(Duration(milliseconds: 2000), () {
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
        body: ListView(
          children: [
            LabeledCheckbox(
              label: 'Tôi không xem được phim đang phát hành',
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              value: listSeleted[1],
              onChanged: (bool newValue) {
                setState(() {
                  listSeleted[1] = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'Ứng dụng có lỗi',
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              value: listSeleted[2],
              onChanged: (bool newValue) {
                setState(() {
                  listSeleted[2] = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'Sự cố về chính sách',
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              value: listSeleted[3],
              onChanged: (bool newValue) {
                setState(() {
                  listSeleted[3] = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'Tôi không xem được phim đang phát hành',
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              value: listSeleted[0],
              onChanged: (bool newValue) {
                setState(() {
                  listSeleted[0] = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'Tôi bị spam/scams',
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              value: listSeleted[4],
              onChanged: (bool newValue) {
                setState(() {
                  listSeleted[4] = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'KHông thuộc các vấn đề trên',
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              value: listSeleted[5],
              onChanged: (bool newValue) {
                setState(() {
                  listSeleted[5] = newValue;
                });
              },
            ),
            Divider(
              thickness: 2,
              color: Colors.white,
            ),
            Container(
              height: 300,
              margin: EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (val) {
                },
                maxLines: 30,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nhập chi tiết vấn đề của bạn",
                    hintStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400)),
              ),
            )
          ],
        ));
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Container(
              height: 20,
              width: 20,
              color: Colors.white,
              child: Checkbox(
                checkColor: Colors.blue,
                activeColor: Colors.white,
                hoverColor: Colors.white,
                focusColor: Colors.white,
                value: value,
                onChanged: (bool? newValue) {
                  onChanged(newValue!);
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )),
          ],
        ),
      ),
    );
  }
}
