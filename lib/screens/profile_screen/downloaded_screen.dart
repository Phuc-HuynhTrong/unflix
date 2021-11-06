import 'package:flutter/material.dart';
import 'package:unflix/core/models/SuperIcon.dart';

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
      "50 sắc thái tập 1 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 1 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 1 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 1 full HD VietSub không che",
      "Family Television series",
      "24tr lượt xem  -  2 năm trước",
      "assets/images/horizontal1.jpg"),
  new VideoItem(
      "50 sắc thái tập 1 full HD VietSub không che",
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color:  Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Tải xuống',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 18),
            child: Icon(
              Icons.cast,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Video đã tải xuống',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            for (int i = 0; i < downloadedVideo.length; i++)
              Container(
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
                    SizedBox(
                      width: 10,
                    ),
                    SuperIcon(
                        iconPath: 'assets/icons/moreAction-icon.svg', size: 19)
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Video đề xuất tải xuống',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            for (int i = 0; i < downloadedVideo.length; i++)
              Container(
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
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.download,
                          color: Color(0xffe7e7e7),
                          size: 16,
                        ))
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
