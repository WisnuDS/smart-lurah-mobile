import 'package:SmartLurah/main.dart';
import 'package:flutter/material.dart';

class RootWidget extends StatelessWidget{
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
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           label: "Test",
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.mail),
           label: "Test",
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: "Test",
         )
       ],
     ),
   );
  }

}