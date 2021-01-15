import 'dart:convert';

import 'package:SmartLurah/Animation/FadeAnimation.dart';
import 'package:SmartLurah/ragister.dart';
import 'package:SmartLurah/rootWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:http/http.dart' as http;
import 'status.dart';


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

  class HomePage extends StatelessWidget {
    final usernameController = TextEditingController();
    final pinController = TextEditingController();

    Future<UserStatus> createUser(String name, int password) async {
    final http.Response response = await http.post(
      'https://e7a06d93c701.ngrok.io/api/login/member/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'pin': password,
        'username' : name,
      }),
    );

    if (response.statusCode == 200) {
      return UserStatus.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to create album.');
    }
  }

  showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Opps"),
    content: Text("Your credential not match any record"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 130,
                        height: 190,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/logo.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: pinController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "PIN",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          createUser(usernameController.text, int.parse(pinController.text)).then((value) => {
                            if(value.status){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RootWidget(id: value.id,)))
                            }else{
                              showAlertDialog(context)
                            }
                          })
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white.withOpacity(0),
                            shadowColor: Colors.white.withOpacity(0)),
                        child: FadeAnimation(
                            2,
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      FadeAnimation(1.8, Container(
                          padding: EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SignInButton(
                                Buttons.Apple,
                                mini: true,
                                onPressed: () {
                                  
                                },
                              ),
                              SignInButton(
                                Buttons.GitHub,
                                mini: true,
                                onPressed: () {
                                  
                                },
                              ),
                              SignInButton(
                                Buttons.Facebook,
                                mini: true,
                                onPressed: () {
                                  
                                },
                              ),
                              SignInButtonBuilder(
                                icon: Icons.email,
                                text: "Ignored for mini button",
                                mini: true,
                                onPressed: () {
                                  
                                },
                                backgroundColor: Colors.cyan,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()))
                              },
                          child: FadeAnimation(
                              1.5,
                              Text("Don't have account? Sign up here",
                                  style: TextStyle(
                                      color:
                                          Color.fromRGBO(143, 148, 251, 1)))),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white.withOpacity(0),
                              shadowColor: Colors.white.withOpacity(0))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
