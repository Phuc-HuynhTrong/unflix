import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class DisplayMovieSceen extends StatefulWidget {
  const DisplayMovieSceen({Key? key}) : super(key: key);

  @override
  _DisplayMovieSceenState createState() => _DisplayMovieSceenState();
}

class _DisplayMovieSceenState extends State<DisplayMovieSceen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool showAllButton = false;
  double volumnDefault = 0.75;
  double speed = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _controller = VideoPlayerController.asset(
        'assets/videos/THE-QUEEN_S-GAMBIT-Trailer-_2020_.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            MaterialButton(
              padding: EdgeInsets.all(0),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  if (showAllButton == true) {
                    setState(() {
                      showAllButton = false;
                    });
                  } else
                    setState(() {
                      showAllButton = true;
                    });
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          children: [
                            VideoPlayer(_controller),
                            Visibility(
                              visible: _controller.value.isPlaying
                                  ? showAllButton
                                      ? false
                                      : true
                                  : true,
                              child: Container(
                                height: 10,
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      5 /
                                      6,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: VideoProgressIndicator(
                                  _controller,
                                  allowScrubbing: true,
                                ),
                              ),
                            ),
                          ],
                        ),
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
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: showAllButton ? false : true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.cast,
                          color: Colors.white,
                          size: 30,
                        ),
                        Center(
                          child: Text(
                            '"GAMBIT HẬU"',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Exit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showAllButton ? false : true,
                    child: Row(
                      children: [
                        RotationTransition(
                            turns: new AlwaysStoppedAnimation(270 / 360),
                            child: Container(
                                height: 20,
                                child:
                                    Slider(value: 0.5, onChanged: (val) {}))),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {},
                            child: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'assets/icons/rotate-left.png',
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                _controller.play();
                                showAllButton = true;
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
                              size: 40,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: MaterialButton(
                            padding: EdgeInsets.all(0),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {},
                            child: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'assets/icons/rotate-right.png',
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                        RotationTransition(
                            turns: new AlwaysStoppedAnimation(270 / 360),
                            child: Container(
                                height: 20,
                                child:
                                    Slider(value: 0.5, onChanged: (val) {}))),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showAllButton ? false : true,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/bolt.png'),
                              Text(
                                'Tốc độ ${speed}x',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/LockOpen.png'),
                              Text(
                                'Khóa',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/Stack.png'),
                              Text(
                                'Các tập',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/ChatTeardropDots.png'),
                              Text(
                                'Âm thanh và phụ đề',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/SkipForward.png'),
                              Text(
                                'Tập tiếp theo',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
