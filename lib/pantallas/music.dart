import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Music extends StatelessWidget{

  late String song;

  late AudioPlayer audioPlayer;

  void initState(){
    audioPlayer;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(100, 80),
          ),
        ),
        toolbarHeight: 30,
        elevation: 0,
        title: Text(
          "Reproductor Musica",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("REPRODUCIENDO:"),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(onPressed: (){audioPlayer.pause();}, icon: Icon(FontAwesomeIcons.pause)),
                IconButton(onPressed: (){audioPlayer.play(song);}, icon: Icon(FontAwesomeIcons.play)),
                IconButton(onPressed: (){audioPlayer.stop();}, icon: Icon(FontAwesomeIcons.stop)),
              ],
            )
          ]
        )
      ),
    );
  }
}