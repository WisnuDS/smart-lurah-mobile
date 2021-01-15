import 'package:SmartLurah/main.dart';
import 'package:SmartLurah/pengajuan.dart';
import 'package:SmartLurah/riwayat.dart';
import 'package:flutter/material.dart';

class RootWidget extends StatefulWidget{
  final int id;

  const RootWidget({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RootWidget();
  }

}

class _RootWidget extends State<RootWidget>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    Riwayat(),
    Pengajuan(),
    Pengajuan()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Smart Lurah"),
        actions: [
          ElevatedButton.icon(
            onPressed: ()=>{
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false)
            }, 
            icon: Icon(Icons.logout), 
            label: Text(""),
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            label: "Pengajuan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Notifikasi",
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}