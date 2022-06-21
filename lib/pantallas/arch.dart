import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

class Archivos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Archivos();
  }
}

class _Archivos extends State<Archivos>{
  var files;
 
  void getFiles() async {
      List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
      var root = storageInfo[0].rootDir;
      var fm = FileManager(root: Directory(root));
      files = await fm.filesTree( 
        excludedPaths: ["/storage/emulated/0/Android"],
        extensions: ["mp3","mp4"]
      );
  }

  @override
  void initState() {
    getFiles();
    super.initState();
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
          "Archivos",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body:files == null? Center(child: Text("Buscando Archivos"),):
           ListView.builder(
              itemCount: files?.length ?? 0,
              itemBuilder: (context, index) {
                    return Card(
                      child:ListTile(
                         title: Text(files[index].path.split('/').last),
                         leading: Icon(Icons.audiotrack),
                         trailing: Icon(Icons.play_arrow, color: Colors.redAccent,),
                         onTap: (){
                            
                         },
                      )
                    );
              },
          )
    );
  }
  
}