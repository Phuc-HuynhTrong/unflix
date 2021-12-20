import 'package:flutter/material.dart';
import 'package:unflix/screens/profile_screen/report_issue.dart';
import 'package:unflix/screens/profile_screen/send_question_screen.dart';
import 'package:unflix/style/text_style.dart';

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
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        textTheme:
            TextTheme(headline6: TextInApp().navigation(Colors.white, context)),
        title: const Text(
          "Trợ giúp và phản hồi",
        ),
      ),
      body: Column(
        children: [
          Container(
              color: const Color(0xff121212),
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    width: 24,
                  ),
                  const Text(
                    "Trung tâm trợ giúp",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SendQuestionScreen()));
            },
            child: Container(
                color: const Color(0xff121212),
                height: 64,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      width: 24,
                    ),
                    const Text(
                      "Gửi phản hồi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportIssue()));
            },
            child: Container(
                color: const Color(0xff121212),
                height: 64,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      width: 24,
                    ),
                    const Text(
                      "Báo cáo sự cố",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )),
          ),
          Container(
              color: const Color(0xff121212),
              height: 64,
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    width: 24,
                  ),
                  const Text(
                    "Điều khoản và chính sách",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
