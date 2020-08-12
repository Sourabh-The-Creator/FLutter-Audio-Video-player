import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

AudioPlayer myaudio = AudioPlayer();

class myaudioclass extends StatefulWidget {
  @override
  _myaudioclassState createState() => _myaudioclassState();
}

class _myaudioclassState extends State<myaudioclass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF09203f),
      child: ListView(
        children: [
          /*koibhi("https://funksyou.com/fileDownload/Songs/128/34154.mp3",
              "https://img.wynk.in/unsafe/275x275/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_sonymusic/music/srch_sonymusic_A10328E0009654494N.jpg"),
          */
          koibhi(
              "Dil Bechara",
              "A.R. Rahaman",
              "https://funksyou.com/fileDownload/Songs/128/34154.mp3",
              "https://img.wynk.in/unsafe/275x275/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_sonymusic/music/srch_sonymusic_A10328E0009654494N.jpg"),
          koibhi(
              "Sample Audio",
              "Unknown",
              "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3",
              "https://th.bing.com/th/id/OIP.RMilw7v9d_T1JoC5-PRMNQHaHa?pid=Api&w=900&h=900&rs=1"),
          koibhi(
              "Sample Audio",
              "Unknown",
              "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3",
              "https://th.bing.com/th/id/OIP.Rocxpeebi-seRaY8WRJRgQHaHa?pid=Api&w=183&h=183&c=7&dpr=1.25"),
          koibhi(
              "Sample Audio",
              "Unknown",
              "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3",
              "https://th.bing.com/th/id/OIP.Tt_Ct-B3FwA1x7H9qi87vAHaFE?pid=Api&w=183&h=125&c=7&dpr=1.25"),
        ],
      ),
    );
  }
}

class koibhi extends StatelessWidget {
  var koiimage;
  var koiaudio;
  var song_title;
  var artist;
  koibhi(title, name, audio, image) {
    koiimage = image;
    koiaudio = audio;
    song_title = title;
    artist = name;
  }
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => maudio(koiaudio, koiimage),
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
                2.2, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xFF09203f),
              const Color(0xFF537895)
            ], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(koiimage),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    song_title,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    artist,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
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

var nurl;
var nimg;

class maudio extends StatefulWidget {
  maudio(String audiourl, String img) {
    nurl = audiourl;
    nimg = img;
  }

  @override
  _maudioState createState() => _maudioState();
}

class _maudioState extends State<maudio> {
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF09203f),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {});
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Audio Player",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
                2.2, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xFF09203f),
              const Color(0xFF537895)
            ], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 50, left: 30, right: 30),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(nimg),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10),
              height: 110,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: isPlaying
                          ? Icon(
                              Icons.pause,
                              size: 50,
                            )
                          : Icon(
                              Icons.play_arrow,
                              size: 50,
                            ),
                      onPressed: () {
                        if (isPlaying) {
                          myaudio.pause();
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          myaudio.play(nurl);
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      }),
                  IconButton(
                    icon: Icon(
                      Icons.stop,
                      size: 50,
                    ),
                    onPressed: () {
                      myaudio.stop();
                      setState(
                        () {
                          isPlaying = false;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
