import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
    _initializeVideoPlayerFuture = _controller.initialize();
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
                    if (canPressed == true) {
                      setState(() {
                        showAllButton = true;
                      });
                    }
                    if (isShowChapter == true) {
                      setState(() {
                        isShowChapter = false;
                        canPressed = true;
                      });
                    }
                    if (isEditSub == true) {
                      setState(() {
                        isEditSub = false;
                        canPressed = true;
                      });
                    }
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
                              visible: showAllButton,
                              child: Container(
                                decoration: const BoxDecoration(
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
                        const Icon(
                          Icons.cast,
                          color: Colors.white,
                          size: 26,
                        ),
                        const Center(
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
                          icon: const Icon(Icons.close, color: Colors.white),
                        ),
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
                              turns: const AlwaysStoppedAnimation(270 / 360),
                              child: Container(
                                  height: 160,
                                  child: Slider(
                                      divisions: 100,
                                      activeColor: Colors.white70,
                                      inactiveColor: Colors.white30,
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
                      Spacer(),
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
                                border: Border.all(
                                    color: Colors.white70, width: 1)),
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white70,
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
                      Spacer(),
                      Visibility(
                        visible: showAllButton,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.volume_up_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            RotationTransition(
                              turns: const AlwaysStoppedAnimation(270 / 360),
                              child: Container(
                                  height: 160,
                                  child: Slider(
                                      divisions: 100,
                                      activeColor: Colors.white70,
                                      inactiveColor: Colors.white30,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: _controller,
                            builder: (BuildContext context,
                                VideoPlayerValue value, Widget? child) {
                              return Text(
                                _controller.value.position
                                    .toString()
                                    .substring(0, 7),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 13),
                              );
                            },
                          ),
                          Text(
                            _controller.value.duration
                                .toString()
                                .substring(0, 7),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13),
                          )
                        ],
                      )),
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
                              const SizedBox(width: 8),
                              const Text(
                                'Các tập',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              canPressed = false;
                              showAllButton = false;
                              isEditSub = true;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/ChatTeardropDots.png'),
                              const SizedBox(width: 8),
                              const Text(
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
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
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
                                  MediaQuery.of(context).size.height / 6 + 15,
                              width: MediaQuery.of(context).size.width - 90,
                              child: Column(
                                children: [
                                  Slider(
                                    divisions: 6,
                                    min: 0.5,
                                    max: 2,
                                    activeColor: Colors.white70,
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
                                    children: const [
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
                      Column(
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
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                  size: 30,
                                )),
                          ),
                          const Text(
                            "Màn hình khóa",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Ấn để mở khóa\n",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          )
                        ],
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
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 100,
                              sigmaY: 100,
                              tileMode: TileMode.values[0]),
                          child: Container(
                              //color: Colors.black,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Container(
                                    child: ListChapter(
                                      list: listPoster.listContinue2,
                                    ),
                                  ),
                                ],
                              )),
                        ),
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
                  visible: isEditSub,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        padding: const EdgeInsets.all(0),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            isEditSub = false;
                            showAllButton = true;
                            canPressed = true;
                          });
                        },
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 100,
                              sigmaY: 100,
                              tileMode: TileMode.values[0]),
                          child: Container(
                              color: Colors.black54,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding:
                                        EdgeInsets.fromLTRB(50, 100, 30, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Âm thanh\n",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "            Tiếng anh [Gốc]",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "            Tiếng Nhật",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "            Tiếng Việt",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "            Tiếng Hàn",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding:
                                        EdgeInsets.fromLTRB(50, 100, 30, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Phụ đề\n",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "            Tắt",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "            Tiếng anh [CC]",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "            Tiếng Việt",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "            Tiếng Hàn",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
