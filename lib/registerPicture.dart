import 'package:SmartLurah/takePicture.dart';
import 'package:flutter/material.dart';


class RegisterPicture extends StatelessWidget {
  final String state;

  RegisterPicture({Key key, @required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uree',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CameraScreen(state: this.state,),
    );
  }
}