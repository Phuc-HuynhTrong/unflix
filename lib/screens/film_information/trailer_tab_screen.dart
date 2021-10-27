import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class TrailerTabScreen extends StatefulWidget {
  const TrailerTabScreen({Key? key}) : super(key: key);

  @override
  _TrailerTabScreenState createState() => _TrailerTabScreenState();
}

class _TrailerTabScreenState extends State<TrailerTabScreen> {
  late VideoPlayerController _videoPlayerControllercontroller;
  late Future<void> _initializeVideoPlayer1Future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerControllercontroller = VideoPlayerController.asset(
        'assets/videos/THE-QUEEN_S-GAMBIT-Trailer-_2020_.mp4');
    _initializeVideoPlayer1Future = _videoPlayerControllercontroller.initialize();
    _videoPlayerControllercontroller.setLooping(true);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      ),
      child: Stack(
        children: [
          MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: (){
              setState(() {
                if (_videoPlayerControllercontroller.value.isPlaying) {
                  _videoPlayerControllercontroller.pause();
                } else {
                  _videoPlayerControllercontroller.play();
                }
              });
            },
            child: Container(
              height: 211,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: _initializeVideoPlayer1Future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _videoPlayerControllercontroller.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerControllercontroller),
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
                    visible: _videoPlayerControllercontroller.value.isPlaying?false:true,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (_videoPlayerControllercontroller.value.isPlaying) {
                            _videoPlayerControllercontroller.pause();
                          } else {
                            _videoPlayerControllercontroller.play();
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
                          _videoPlayerControllercontroller.value.isPlaying
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
    );
  }
}
