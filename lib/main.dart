import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amity_project/selectmenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Amity',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0,0),
          child:
          Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Image.asset('assets/images/main2.gif', width: 500, height: 500),
                Positioned(
                  top: 70,
                  child:
                  Image.asset('assets/images/logo.png', width: 400, height: 70,),
                ),
              ],),


              //GameStartBtn
              Container(
                margin: EdgeInsets.all(10),
                child:
                TextButton(onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SelectMenu()),
                  );
                },
                  child: Text("게임시작",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      elevation: 10,
                      primary: Colors.lightGreenAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child:
                TextButton(onPressed: () {
                  /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Board()),
                );*/
                },
                  child: Text("게시판",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Yanolja",
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      elevation: 10,
                      primary: Colors.lightGreenAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(40),
                  child:
                  Text("ⓒ 2022. ino Inc.All rights reserved",
                    style: TextStyle(
                      fontSize: 7,
                      color: Colors.grey,
                    ),
                  )
              )
            ],
          )
      ),

    );
  }
}
