import 'dart:io';
import 'package:funcional_flutter/BOW.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget{
  @override
  _Video createState() => _Video();

}

class _Video extends State<Video>{

  final File video = File("");
  late final VideoPlayerController vpc;

  @override
  void initState(){
    super.initState();
    vpc = VideoPlayerController.file(video)..addListener(() => setState(() {}))
        ..setLooping(true)
        ..initialize().then((_) => vpc.play());
  }

  void dispose(){
    vpc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(100, 80),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 30,
        elevation: 0,
        title: Text(
          "Reproductor Video",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: vpc != null && vpc.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : Container(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            )
    );
  }
   Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(child: BasicOverlayWidget(controller: vpc)),
        ],
  );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: vpc.value.aspectRatio,
        child: VideoPlayer(vpc),
  );

}