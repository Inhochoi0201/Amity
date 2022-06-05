import 'package:amity_project/selectmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:async';

class Game2 extends StatelessWidget{
  const Game2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: "폭탄 게임",
      debugShowCheckedModeBanner: false,
      home: Game2Option(),
    );
  }
}
//가리기모드 체크
bool _timevis = false;

class Game2OptionMenu extends State<Game2Option>{
  bool _timeLen = false;
  final List<String> _conList = ['직업','노래','영화','연예인','배우','아이돌','나라','드라마',
    '도시','무기','음식','디저트','전자기기','게임','식물','동물','브랜드','운동','운동선수','걸그룹','보이그룹'];

  void checkTime(){
    if(!_timeLen){
      _currentTimer = 10 + Random().nextInt(50);
    }else{
      _currentTimer = 50 + Random().nextInt(60);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
              children: [
                Image.asset("assets/images/logo.png"),
                Divider(
                  height: 30,
                  color: Colors.lightGreenAccent[400],
                ),
                Stack(children: [
                  Image.asset("assets/images/bomb.png" ,width: 400, height: 250,),
                  Positioned(
                      top: 150,
                      left: 45,
                      child: Text("폭탄게임",
                        style: TextStyle(
                          fontSize: 72,
                          color: Colors.tealAccent[700],
                          fontWeight: FontWeight.bold,
                        ),)),
                ],
                ),
                Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("모드  "
                              , style: TextStyle(
                                fontSize: 30,
                              ),),
                            Text(
                                "타이머ON ",
                                style: TextStyle(
                                  fontSize: 15,
                                )
                            ),
                            Container(
                                width: 50,
                                padding: EdgeInsets.only(left: 20),
                                child:
                                Switch(
                                  value: _timevis,
                                  onChanged: (value) {
                                    setState(() {
                                      _timevis = value;
                                    });
                                  },
                                  activeColor: Colors.greenAccent[400],
                                )
                            ),
                            Text("   타이머OFF"
                              , style: TextStyle(
                                fontSize: 15,
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("타이머   "
                              , style: TextStyle(
                                fontSize: 30,
                              ),),
                            Text(
                              "Short ",
                              style: TextStyle(
                               fontSize: 15,
                              )
                            ),
                            Container(
                                width: 50,
                                padding: EdgeInsets.only(left: 20),
                                child:
                                Switch(
                                  value: _timeLen,
                                  onChanged: (value) {
                                    setState(() {
                                      _timeLen = value;
                                    });
                                  },
                                  activeColor: Colors.greenAccent[400],
                                )
                            ),
                            Text("       Long"
                              , style: TextStyle(
                                fontSize: 15,
                              ),),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(40),

                          child: TextButton(onPressed: () {
                            checkTime(); //스위치 상태 계산
                            currentCon = _conList[Random().nextInt(_conList.length-1)]; //주제선정
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => new PlayInGame2()),
                            );
                            print('game2');
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
                          padding: EdgeInsets.only(top: 20),
                          child:
                          TextButton(onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SelectMenu()));
                          },
                            child: Text("뒤로가기",
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
                          ),)
                      ],
                    )
                ),
              ]),
        )
    );
  }

}

class Game2Option extends StatefulWidget{
  const Game2Option({Key? key}) : super(key: key);

  @override
  Game2OptionMenu createState() => Game2OptionMenu();
}

//폭탄게임실제동작
class PlayInGame2 extends StatelessWidget {
  const PlayInGame2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InGame2(),
    );
  }
}

class InGame2 extends StatefulWidget{
  const InGame2({Key? key}) : super(key: key);

  @override
  InGame2View createState() => InGame2View();
}

//폭탄 게임 뷰
class InGame2View extends State<InGame2>{
  //주제 글자크기
  double _chkConLen(){
    if(currentCon!.length <= 3)
      return 90;
    else
      return 65;
  }
  //주제 글자 포지션
  double _chkConpos(){
    if(currentCon!.length == 2){
      return 100;
    }else if(currentCon!.length == 4) {
      return 60;
    }else{
      return 55;
    }
  }
  double _chkConposTop(){
    if(currentCon!.length == 4){
      return 70;
    }else
      return 55;
  }
  //뒤로가기 경고창
  void back(){
    pause();
    setState((){
      isPlaying = false;
      _playIcon =Icons.play_arrow;
      _playCol = Colors.grey;
      _currentState = '다시시작';
    });

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Column(
              children: [
                new Text('Warning'),
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('게임진행을 멈추고 나가시겠습니까?')
              ],
            ),
            actions: [
              new FlatButton(
                child: new Text("나가기"),
                onPressed:(){
                  Navigator.pop(context);
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Game2()),
                  );
                },
              ),
              new FlatButton(
                child: new Text("계속하기"),
                onPressed:(){
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
//백버튼을 눌렀을 때
  Future<bool> _onBackKey() async{
    return await showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(backgroundColor: Colors.amber,
        title: Text(
          "진행중이던 게임을 멈추고 나가시겠습니까?.",
        ) ,
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context, 1);
          }, child: Text('종료')),
          TextButton(onPressed: (){
            Navigator.pop(context, 0);
          }, child: Text('취소')),
        ],
      );
    });
  }
  //일시정지 버튼
  var _playIcon = Icons.play_arrow;
  var _playCol = Colors.grey;
  var _currentState = '시작';

  // 타이머 구성
  var time  = _currentTimer;
  Timer? timer;
  var isPlaying = false;

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  Widget TimerTxt(){
    if(time == -100)
      {
        return Text(' ',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            )
        );
      }
      else{
      return Text('$time',
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
        )
    );
      }
  }

  bool _isOver = false;
  @override
  Widget changeImg(){
    if(!_isOver){
      return
        CircleAvatar(
            backgroundImage: AssetImage('assets/images/bombdeco.gif'),
            radius: 200);
    }else {
      return
        Padding(
            padding: EdgeInsets.only(top: 50),
            child: Image.asset('assets/images/bombdeco2.gif', width: 250, height: 250,)
        );
    }
}

  void start() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        isPlaying = true;
        if(time > 0) {
          time--;
          if (time == 1) _isOver = true;
        }
        else if(time == 0){
          gameover();
        }
      });
    });
  }
  void pause(){
    timer?.cancel();
    setState((){
      isPlaying = false;
    });
  }


  //게임오버
  void gameover(){
    timer?.cancel();
    time = -100;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Column(
              children: [
                new Text('Result'),
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('GameOver!')
              ],
            ),
            actions: [
              new FlatButton(
                child: new Text("다시하기"),
                onPressed:(){
                  Navigator.pop(context);
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Game2()),
                  );
                },
              ),
            ],
          );
        });
  }

  //게임내 필요요소
  void _clickTimer(){
    setState(() {
      if(_playIcon == Icons.play_arrow){
        _playIcon = Icons.pause;
        _playCol = Colors.amber;
        _currentState = '일시정지';
        start();

      }else{
        _playIcon =Icons.play_arrow;
        _playCol = Colors.grey;
        _currentState = '다시시작';
        pause();
      }}
    );
  }


  //UI
  @override
  Widget build(BuildContext context){
    return WillPopScope(onWillPop: (){
      return _onBackKey();
    },
    child: Scaffold(
    body: Padding(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Column(children: [
        Row(children: [
          Icon(Icons.timer,
              size: 50),
          Container(
            width: 50,
            child:TimerTxt(),
          ),
          Container(
              padding: EdgeInsets.only(left:40),
              child:
              TextButton.icon(onPressed: () {
                _clickTimer();
              },
                label: Text('$_currentState',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                icon: Icon(
                  _playIcon,
                  size: 30,
                  color: Colors.black,
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 30),
                    elevation: 10,
                    primary: _playCol,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)
                    )
                ),
              )
          ),
          Container(
              padding: EdgeInsets.only(left: 70),
              child:
              IconButton(
                onPressed: back,
                icon: Icon(Icons.arrow_back,
                  color: Colors.greenAccent[400],),
                iconSize: 30,
              )),
        ],),
        Divider(
          height: 20,
          color: Colors.lightGreenAccent[400],
          thickness: 1.5,
        ),
        Stack(
          children: [
            Padding(padding: EdgeInsets.only(top: 30),
            child: Image.asset("assets/images/bombgame.png"),
            ),
            Positioned(
                top: _chkConposTop(),
                left: _chkConpos(),
                child: Text('$currentCon',
                  style: TextStyle(
                    fontSize: _chkConLen(),
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ))
          ],
        ),
        Container(
          padding: EdgeInsets.all(30),
          child:
              Center( child:
                changeImg(),
              )
              )
    ],),
    )
    ),
    );
  }
}

var _currentTimer; //타이머
String? currentCon; //주제선정

