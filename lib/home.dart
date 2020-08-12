import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController videoPlayerController;
ChewieController chewieController;

class mybody extends StatefulWidget {
  @override
  _mybodyState createState() => _mybodyState();
}

class _mybodyState extends State<mybody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end:
              Alignment(2.2, 0.0), // 10% of the width, so there are ten blinds.
          colors: [
            const Color(0xFF09203f),
            const Color(0xFF537895)
          ], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: <Widget>[
          Container(
            // color: Colors.red,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topCenter,
            width: double.infinity,

            child: video(
              "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
            ),
          ),
          Container(
            // color: Colors.red,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            width: double.infinity,

            child: video(
              "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4",
            ),
          ),
          Container(
            // color: Colors.red,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            width: double.infinity,

            child: video(
              "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_1MB.mp4",
            ),
          ),
          Container(
            // color: Colors.red,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            width: double.infinity,

            child: video(
              "https://test-videos.co.uk/vids/jellyfish/mp4/h264/1080/Jellyfish_1080_10s_1MB.mp4",
            ),
          ),
        ],
      ),
    );

    //"https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"),
    //"https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"),
  }
}

video(var url) {
  chewieController = ChewieController(
    videoPlayerController: VideoPlayerController.network(url),
    aspectRatio: 16 / 9,
    autoPlay: false,
    autoInitialize: true,
    looping: true,
  );

  return Container(
    child: Chewie(
      controller: chewieController,
    ),
  );
}
