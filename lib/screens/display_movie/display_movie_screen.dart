import 'dart:async';
import 'package:screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unflix/core/data/listposter.dart';
import 'package:unflix/screens/display_movie/listChapter.dart';
import 'package:video_player/video_player.dart';

class DisplayMovieScreen extends StatefulWidget {
  final String assetVideo;
  final bool isSingleFlim;
  DisplayMovieScreen({
    Key? key,
    required this.assetVideo,
    required this.isSingleFlim,
  }) : super(key: key);
  @override
  _DisplayMovieScreenState createState() => _DisplayMovieScreenState();
}

class _DisplayMovieScreenState extends State<DisplayMovieScreen>
    with TickerProviderStateMixin {
  ListPoster listPoster = ListPoster();
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool showAllButton = false;
  double volumnDefault = 0.75;
  double speed = 1;
  double brightness = 0.5;
  bool isEditSpeed = false;
  bool isLockScreen = false;
  bool isShowChapter = false;
  bool isEditSub = false;
  bool canPressed = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _controller = new VideoPlayerController.asset(widget.assetVideo);
    _initializeVideoPlayerFuture =  _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  initPlatformState() async {
    double brightness = await Screen.brightness;
    setState(() {
      brightness = brightness;
    });
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
                  } else {
                    if (canPressed == true)
                      setState(() {
                        showAllButton = true;
                      });
                    if (isShowChapter == true)
                      setState(() {
                        isShowChapter = false;
                        canPressed = true;
                      });
                  }
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
                            Visibility(
                              visible: showAllButton,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    colors: [
                                      Colors.black26,
                                      Colors.black26,
                                    ],
                                    radius: 1.0,
                                  ),
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
                    visible: showAllButton,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.cast,
                          color: Colors.white,
                          size: 26,
                        ),
                        Center(
                          child: Text(
                            '"GAMBIT HẬU"',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              await SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitDown,
                                DeviceOrientation.portraitUp
                              ]);
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close, color: Colors.white
                            ),),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: showAllButton,
                        child: Column(
                          children: [
                            Image.asset('assets/icons/Spinner.png'),
                            RotationTransition(
                              turns: new AlwaysStoppedAnimation(270 / 360),
                              child: Container(
                                  height: 160,
                                  child: Slider(
                                      divisions: 100,
                                      activeColor: Colors.white,
                                      inactiveColor: Colors.grey,
                                      value: brightness,
                                      onChanged: (val) {
                                        setState(() {
                                          Screen.setBrightness(val);
                                          brightness = val;
                                        });
                                      })),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: showAllButton,
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                _controller.seekTo(_controller.value.position -
                                    Duration(seconds: 10));
                              });
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'assets/icons/rotate-left.png',
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: showAllButton,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                                showAllButton = true;
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
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: showAllButton,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: MaterialButton(
                            padding: EdgeInsets.all(0),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                _controller.seekTo(_controller.value.position +
                                    Duration(seconds: 10));
                              });
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'assets/icons/rotate-right.png',
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: showAllButton,
                        child: Column(
                          children: [
                            Icon(
                              Icons.volume_up_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            RotationTransition(
                              turns: new AlwaysStoppedAnimation(270 / 360),
                              child: Container(
                                  height: 160,
                                  child: Slider(
                                      divisions: 100,
                                      activeColor: Colors.white,
                                      inactiveColor: Colors.grey,
                                      value: volumnDefault,
                                      onChanged: (val) {
                                        setState(() {
                                          volumnDefault = val;
                                          _controller.setVolume(val);
                                        });
                                      })),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: showAllButton,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              showAllButton = false;
                              isEditSpeed = true;
                              canPressed = false;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/bolt.png'),
                              SizedBox(width: 8),
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
                          onPressed: () {
                            setState(() {
                              showAllButton = false;
                              canPressed = false;
                              isLockScreen = true;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/LockOpen.png'),
                              SizedBox(width: 8),
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
                          onPressed: () {
                            setState(() {
                              canPressed = false;
                              showAllButton = false;
                              isShowChapter = true;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/Stack.png'),
                              SizedBox(width: 8),
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
                              SizedBox(width: 8),
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
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      SystemChrome.setPreferredOrientations([
                                        DeviceOrientation.landscapeLeft,
                                        DeviceOrientation.landscapeRight
                                      ]);
                                      return DisplayMovieScreen(
                                          assetVideo:
                                          'assets/videos/EternalsTrailers.mp4',
                                          isSingleFlim: false);
                                    }));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/SkipForward.png'),
                              SizedBox(width: 8),
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: isEditSpeed,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height / 6 + 10,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height / 6 + 10,
                              width: MediaQuery.of(context).size.width - 90,
                              child: Column(
                                children: [
                                  Slider(
                                    divisions: 6,
                                    min: 0.5,
                                    max: 2,
                                    activeColor: Colors.white,
                                    inactiveColor: Colors.grey,
                                    onChanged: (val) {
                                      setState(() {
                                        speed = val;
                                        _controller.setPlaybackSpeed(speed);
                                      });
                                    },
                                    value: speed,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '0.5x',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '0.75x',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '1x',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '1.25x',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '1.5x',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '1.75x',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '2x',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isEditSpeed = false;
                                    showAllButton = true;
                                    canPressed = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: isLockScreen,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            isLockScreen = false;
                            showAllButton = false;
                            canPressed = true;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 40,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: isShowChapter,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.all(0),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            isShowChapter = false;
                            showAllButton = true;
                            canPressed = true;
                          });
                        },
                        child: Container(
                            color: Colors.black,
                            height: 230,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Container(
                                  child: ListChapter(
                                    list: listPoster.listContinue,
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
