import 'package:flutter/material.dart';
import 'package:videop/home.dart';

import 'package:videop/maudio.dart';

class mTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF09203f),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.audiotrack)),
                Tab(
                  icon: Icon(Icons.videocam),
                ),
              ],
            ),
            title: Text('Audio And Video Player'),
          ),
          body: TabBarView(
            children: [
              myaudioclass(),
              mybody(),
            ],
          ),
        ),
      ),
    );
  }
}
