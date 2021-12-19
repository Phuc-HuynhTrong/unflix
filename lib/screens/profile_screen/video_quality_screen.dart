import 'package:flutter/material.dart';
import 'package:unflix/style/text_style.dart';

class VideoQualityScreen extends StatefulWidget {
  const VideoQualityScreen({Key? key}) : super(key: key);

  @override
  State<VideoQualityScreen> createState() => _VideoQualityScreenState();
}

class _VideoQualityScreenState extends State<VideoQualityScreen> {
  int indexSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
        textTheme: TextTheme(
            headline6: TextInApp().navigation(Colors.white, context)),
        title: const Text(
          "Chất lượng video",
        ),
      ),
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                if (indexSelected == 1) {
                  indexSelected = 2;
                } else {
                  indexSelected = 1;
                }
              });
            },
            child: Container(
                //height: 67,
                color: const Color(0xff121212),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: const ListTile(
                        contentPadding: EdgeInsets.fromLTRB(24, 8, 0, 8),
                        title: Text(
                          "Tiêu chuẩn",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "Tải xuống nhanh hơn và ít tốn dung lượng hơn",
                          style: TextStyle(
                              color: Color(0xff9c9c9c),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Visibility(
                        visible: indexSelected == 1 ? true : false,
                        child: const Icon(
                          Icons.check,
                          color: Color(0xFF026EEC),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          MaterialButton(
            padding: const EdgeInsets.only(top: 5),
            onPressed: () {
              setState(() {
                if (indexSelected == 1) {
                  indexSelected = 2;
                } else {
                  indexSelected = 1;
                }
              });
            },
            child: Container(
                color: const Color(0xff121212),
                //height: 67,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: const ListTile(
                        contentPadding: EdgeInsets.fromLTRB(24, 8, 0, 8),
                        title: Text(
                          "Cao hơn",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "Sắc nét nhưng sử dụng nhiều dung lượng hơn",
                          style: TextStyle(
                              color: Color(0xff9c9c9c),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child:
                      Visibility(
                        visible: indexSelected == 2 ? true : false,
                        child: const Icon(
                          Icons.check,
                          color: Color(0xFF026EEC),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
