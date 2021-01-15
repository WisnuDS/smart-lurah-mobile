import 'dart:convert';

import 'package:SmartLurah/status.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pengajuan extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _Pengajuan();
  }
}

Future<List<Service>> fetchArragement() async {
  final response =
      await http.get('https://e7a06d93c701.ngrok.io/api/services/');
  
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var items = jsonDecode(response.body);
    List<Service> arrangements = List<Service>();
    for (var item in items) {
      arrangements.add(Service.fromJson(item));
    }
    return arrangements;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class _Pengajuan extends State<Pengajuan>{
  List<Service> arrangements = List<Service>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchArragement(),
        builder: (context,snapshot){
          if(snapshot.hasError) print(snapshot.error);

        arrangements = snapshot.data ?? arrangements;
          return ListView.builder(
            itemCount: arrangements.length,
            itemBuilder: (context, index) {
              return Card(
                child:ListTile(
                  title: Text(arrangements[index].type),
                )
              );
            },
          );
        }
      ),
    );
  }

}

