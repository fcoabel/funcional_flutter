import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funcional_flutter/pantallas/arch.dart';
import 'package:funcional_flutter/pantallas/music.dart';
import 'package:funcional_flutter/pantallas/video.dart';

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  // dispose function
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: TabBar(
          controller: tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blue,
          labelStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
          tabs: <Tab>[
            Tab(
              icon: Icon(FontAwesomeIcons.file),
              text: "Archivos",
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.music),
              text: "Música",
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.video),
              text: "Vídeo",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Archivos(), 
          Music(),
          Video()       
        ],
      ),
    );
  }
}