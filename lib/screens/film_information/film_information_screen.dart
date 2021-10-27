import 'package:flutter/material.dart';
import 'package:unflix/core/data/ListInformationFilm.dart';
import 'package:unflix/screens/film_information/bottom_tap_bar.dart';
import 'package:unflix/screens/film_information/score_row.dart';
import 'package:video_player/video_player.dart';

class FilmInformationScreen extends StatefulWidget {
  _FilmInformationScreenState createState() => _FilmInformationScreenState();
}

class _FilmInformationScreenState extends State<FilmInformationScreen>
    with TickerProviderStateMixin {
  ListMovieInformation listMovieInformation = ListMovieInformation();
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/THE-QUEEN_S-GAMBIT-Trailer-_2020_.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                MaterialButton(
                  padding: EdgeInsets.all(0),
                  onPressed: (){
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  child: Container(
                    height: 211,
                    margin: EdgeInsets.only(bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
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
                          visible: _controller.value.isPlaying?false:true,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(color: Colors.white, width: 1)),
                              child: Icon(
                                _controller.value.isPlaying
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
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listMovieInformation.listMovie[0].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                ScoreRow(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffF6C700),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 28,
                        ),
                        Text(' Phát',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              cursorColor: Colors.black,
              autofocus: false,
              readOnly: true,
              minLines: 1,
              maxLines: 100,
              initialValue: listMovieInformation.listMovie[0].filmDescription,
              decoration: InputDecoration(
                focusColor: Colors.black,
                fillColor: Colors.black,
                hoverColor: Colors.black,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ), // icon
                    Text(
                      "Danh sách",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ), // text
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 5),
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          "assets/icons/shape.png",
                          fit: BoxFit.fill,
                        )), // icon
                    Text(
                      "Đánh giá",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ), // text
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ), // icon
                    Text(
                      "Chia sẻ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ), // text
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 30,
                    ), // icon
                    Text(
                      "Tải xuống",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ), // text
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 330,
              child: BottomTapBar()),
        ],
      ),
    );
  }
}
