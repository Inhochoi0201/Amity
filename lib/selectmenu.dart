import 'package:amity_project/game1.dart';
import 'package:amity_project/game2.dart';
import 'package:amity_project/game3.dart';
import 'package:amity_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SelectMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Image.asset('assets/images/main2.gif', width: 500, height: 500),
              Positioned(
                top: 70,
                child:
                Image.asset('assets/images/logo.png', width: 400, height: 70,),
              ),
            ],),

            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child:
              TextButton(onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Game1()),
                );
              },
                child: Text("초성게임",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 30),
                    elevation: 10,
                    primary: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child:
              TextButton(onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Game2()),
                );
              },
                child: Text("폭탄게임",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 40),
                    elevation: 10,
                    primary: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child:
              TextButton(onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Game3()),
                );
              },
                child: Text("몸으로말해요",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 40),
                    elevation: 10,
                    primary: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child:
              TextButton.icon(onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()),
                );
              },
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.black,
                ),
                label: Text("Home",
                style: TextStyle(
                  color: Colors.black,
                ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 30),
                    elevation: 10,
                    primary: Colors.lightGreenAccent[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}