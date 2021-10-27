import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class TrailerTabScreen extends StatefulWidget {
  const TrailerTabScreen({Key? key}) : super(key: key);

  @override
  _TrailerTabScreenState createState() => _TrailerTabScreenState();
}

class _TrailerTabScreenState extends State<TrailerTabScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
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
  Widget build(BuildContext context) {
    return Container(
      height: 211,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            height: 211,
            margin: EdgeInsets.only(top: 12, bottom: 12),
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
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
