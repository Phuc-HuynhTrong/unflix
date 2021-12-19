import 'package:flutter/material.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';
import 'package:video_player/video_player.dart';

import 'package:unflix/screens/incoming_screen/notification_screen.dart';

class IncomingScreen extends StatefulWidget {
  const IncomingScreen({Key? key}) : super(key: key);

  @override
  State<IncomingScreen> createState() => _IncomingScreenState();
}

class _IncomingScreenState extends State<IncomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Sắp ra mắt',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.cast,
              ),
            ),
          ],
        ),
        body: Container(
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              ListTile(
                leading: Icon(Icons.notifications_none_outlined),
                title: Text('Thông báo'),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NotificationScreen())),
              ),
              CustomCard(
                title: 'Kẻ đeo bám',
                discription:
                    'Hiện đã kết hôn và có một đứa con nhỏ, Love và Joe cố gắng vun đắp một cuộc sống bình thường ở vùng ngoại ô giàu có Madre Linda. Nhưng mà, thói cũ khó bỏ.',
                tag: 'Đen tối • Kịch tính • Phim giật gân • Chính kịch',
                dateRelease: 'Mùa 3 ra mắt vào 15 tháng 10',
              ),
              CustomCard(
                title: 'Tổng đài truy vết',
                discription:
                    'Bị giáng chức, vị thanh tra biến thành cái đầu buồi',
                tag:
                    'Đen tối • Kịch tính • Phim giật gân • Chính kịch ',
                dateRelease: 'Ra mắt vào Thứ Sáu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconAndLabel extends StatelessWidget {
  const CustomIconAndLabel({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            Icon(icon),
            SizedBox(
              height: 4,
            ),
            Text(label),
          ],
        ));
  }
}

class CustomCard extends StatefulWidget {
  const CustomCard({
    Key? key,
    required this.title,
    required this.discription,
    required this.tag,
    required this.dateRelease,
  }) : super(key: key);

  final String title;
  final String discription;
  final String tag;
  final String dateRelease;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool remindMe = false;
  late VideoPlayerController _videoPlayerControllercontroller1;
  late Future<void> _initializeVideoPlayer1Future1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerControllercontroller1 =
        VideoPlayerController.asset('assets/videos/TopGun.mp4');
    _initializeVideoPlayer1Future1 =
        _videoPlayerControllercontroller1.initialize();
    _videoPlayerControllercontroller1.setLooping(true);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerControllercontroller1.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            height: 200.0,
            width: double.infinity,
            color: Colors.grey,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_videoPlayerControllercontroller1.value.isPlaying) {
                        _videoPlayerControllercontroller1.pause();
                      } else {
                        _videoPlayerControllercontroller1.play();
                      }
                    });
                  },
                  child: Container(
                    height: 211,
                    //margin: EdgeInsets.only(bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: _initializeVideoPlayer1Future1,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _videoPlayerControllercontroller1
                                .value.aspectRatio,
                            child:
                                VideoPlayer(_videoPlayerControllercontroller1),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                          visible:
                              _videoPlayerControllercontroller1.value.isPlaying
                                  ? false
                                  : true,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_videoPlayerControllercontroller1
                                    .value.isPlaying) {
                                  _videoPlayerControllercontroller1.pause();
                                } else {
                                  _videoPlayerControllercontroller1.play();
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Icon(
                                _videoPlayerControllercontroller1
                                        .value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                          image:
                              AssetImage('assets/images/incoming_image.png')),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        widget.dateRelease,
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      remindMe = !remindMe;

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        //width: MediaQuery.of(context).size.width ,
                        backgroundColor: Color(0xffF6C700),
                        content: Text(
                          "Đã cài đặt thông báo",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ));
                    });
                  },
                  child: CustomIconAndLabel(
                    icon: remindMe
                        ? Icons.notifications_rounded
                        : Icons.notifications_none_outlined,
                    label: 'Nhắc tôi',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilmInformationScreen()));
                  },
                  child: CustomIconAndLabel(
                    icon: Icons.info_outline,
                    label: 'Thông tin',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              // ,
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              widget.discription,
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              widget.tag,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
