import 'package:flutter/material.dart';

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
          "Chất lượng video",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
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
                color: const Color(0xff121212),
                height: 67,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: const ListTile(
                        title: Text(
                          "Tiêu chuẩn",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Tải xuống nhanh hơn và ít tốn dung lượng hơn",
                          style: TextStyle(
                              color: Color(0xff9c9c9c),
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: indexSelected == 1 ? true : false,
                      child: const Icon(
                        Icons.check,
                        color: Color(0xFF026EEC),
                        size: 24,
                      ),
                    ),
                  ],
                )),
          ),

          MaterialButton(
            padding: const EdgeInsets.only(top:5),
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
                height: 67,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: const ListTile(
                        title: Text(
                          "Cao hơn",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Sắc nét hơn nhưng sử dụng nhiều dung lượng hơn",
                          style: TextStyle(
                              color: Color(0xff9c9c9c),
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: indexSelected == 2 ? true : false,
                      child: const Icon(
                        Icons.check,
                        color: Color(0xFF026EEC),
                        size: 24,
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
