import 'dart:io';
import 'dart:typed_data';

import 'package:SmartLurah/registerPicture.dart';
import 'package:SmartLurah/rootWidget.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  final String imgPath;
  final String fileName;
  final String state;
  PreviewScreen({this.imgPath, this.fileName, this.state});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.black,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.navigate_next_rounded,color: Colors.white,size: 50,),
                    onPressed: (){
                      if (widget.state == "KTP"){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPicture(state: "DIRI")));
                      }else{
                        // getBytes().then((bytes) {
                        //   print('here now');
                        //   print(widget.imgPath);
                        //   print(bytes.buffer.asUint8List());
                        //   Share.file('Share via', widget.fileName, bytes.buffer.asUint8List(), 'image/path');
                        // });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RootWidget()));
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Future getBytes () async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;
//    print(ByteData.view(buffer))
    return ByteData.view(bytes.buffer);
  }
}