import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unflix/core/models/SuperIcon.dart';
import 'package:unflix/screens/display_movie/display_movie_screen.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';
import 'package:unflix/style/text_style.dart';

class DownloadedScreen extends StatefulWidget {
  const DownloadedScreen({Key? key}) : super(key: key);

  @override
  _DownloadedScreenState createState() => _DownloadedScreenState();
}

class VideoItem {
  var name;
  var thumbnailImg;
  var category;
  var description;

  VideoItem(this.name, this.category, this.description, this.thumbnailImg);
}

var downloadedVideo = [
  new VideoItem(
      "50 sắc thái tập 1 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 2 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 3 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 4 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 5 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 6 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg")
];
var recommendList = [
  new VideoItem(
      "50 sắc thái tập 7 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 8 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 9 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 10 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 11 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 12 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg")
];

class _DownloadedScreenState extends State<DownloadedScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        textTheme:
            TextTheme(headline6: TextInApp().navigation(Colors.white, context)),
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
          'Tải xuống',
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(8),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: const Text(
                'Đã tải xuống',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            for (int i = 0; i < downloadedVideo.length; i++)
              GestureDetector(
                onTap: () async {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight
                  ]);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayMovieScreen(
                                assetVideo: 'assets/videos/TopGun.mp4',
                                isSingleFlim: false,
                              )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(downloadedVideo[i].thumbnailImg,
                            width: 0.384 * size.width,
                            height: 0.384 * size.width * 9 / 16,
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 0.43 * size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Text(
                              downloadedVideo[i].name,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              downloadedVideo[i].category,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff8F8F8F)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              downloadedVideo[i].description,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff8F8F8F)),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: PopupMenuButton(
                        onSelected: (int v) {
                          if (v == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FilmInformationScreen()));
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem<int>(
                            value: 0,
                            onTap: () {
                              setState(() {
                                downloadedVideo.removeAt(i);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  //width: MediaQuery.of(context).size.width ,
                                  backgroundColor: Color(0xffF6C700),
                                  content: Text(
                                    "Đã xóa",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ));
                              });
                            },
                            child: const Text(
                              "Xóa",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: const Text(
                              "Xem thông tin",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                        child: const Icon(
                          Icons.more_vert_rounded,
                          color: Color(0xffe7e7e7),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Đề xuất tải xuống',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            for (int i = 0; i < recommendList.length; i++)
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(recommendList[i].thumbnailImg,
                            width: 0.384 * size.width,
                            height: 0.384 * size.width * 9 / 16,
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 0.43 * size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Text(
                              recommendList[i].name,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              recommendList[i].category,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff8F8F8F)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              recommendList[i].description,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff8F8F8F)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          //width: MediaQuery.of(context).size.width ,
                          backgroundColor: Color(0xffF6C700),
                          content: Text(
                            "Đang tải xuống...",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ));
                        await ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          //width: MediaQuery.of(context).size.width ,
                          backgroundColor: Color(0xffF6C700),
                          content: Text(
                            "Đã tải xuống",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ));
                        Future.delayed(
                            Duration(seconds: 3),
                                () => {
                              setState(() {
                                downloadedVideo.add(recommendList[i]);
                                recommendList.removeAt(i);
                              })
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.download,
                          color: Color(0xffe7e7e7),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
