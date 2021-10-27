import 'package:flutter/material.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                              visible:  _controller.value.isPlaying
                                  ? showAllButton
                                  ? false
                                  : true
                                  : true,
                              child: Container(
                                height: 10,
                                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*5/6,),
                                width: MediaQuery.of(context).size.width,
                                child: VideoProgressIndicator(_controller,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: _controller.value.isPlaying
                          ? showAllButton
                              ? false
                              : true
                          : true,
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
                            size: 40,
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
    );
  }
}
