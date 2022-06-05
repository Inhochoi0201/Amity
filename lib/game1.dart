import 'package:amity_project/selectmenu.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'dart:async';

class Game1 extends StatelessWidget {
  const Game1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: "초성게임",
      debugShowCheckedModeBanner: false,
      home: Game1Option(),
    );
  }
}

class Game1OptionMenu extends State<Game1Option>{
  final List<int> _cntList = [2,3,4,5,6,7,8,9,10];
  int _selectedCnt = 2;
  final List<int> _timerList = [3,4,5,6,7,8,9,10];
  int _selectedTimer = 3;
  final List<String> _conList = ['ㄱ','ㄴ','ㄷ','ㄹ','ㅁ','ㅂ','ㅅ','ㅇ','ㅈ','ㅊ','ㅌ','ㅍ','ㅎ'];

  @override
  Widget build(BuildContext context){
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
              Stack( children: [
                Image.asset("assets/images/board.png"),
                Positioned(
                  top: 40,
                    left: 45,
                    child: Text("초성게임",
                  style: TextStyle(
                    fontSize: 72,
                    color: Colors.white,
                  ),) ),
              ],
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("인원수"
                        , style: TextStyle(
                            fontSize: 30,
                          ),),
                        Container(
                          width: 200,
                          padding: EdgeInsets.only(left: 20),
                            child:
                        DropdownButton(
                          isExpanded: true,
                          value: _selectedCnt,
                          items: _cntList.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text('$value',
                              style: TextStyle(fontSize: 30),),);
                          }).toList(),

                          onChanged: (dynamic value){
                            setState(() {
                              _selectedCnt = value;
                            });
                          },)
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("타이머"
                          , style: TextStyle(
                            fontSize: 30,
                          ),),
                        Container(
                            width: 200,
                            padding: EdgeInsets.only(left: 20),
                            child:
                            DropdownButton(
                              isExpanded: true,
                              value: _selectedTimer,
                              items: _timerList.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text('$value',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 30),),);
                              }).toList(),

                              onChanged: (dynamic value){
                                setState(() {
                                  _selectedTimer = value;
                                });
                              },)
                        )
                      ],
                    )
                  ],
                )
              )
            ,
              TextButton(onPressed: () {
                user = makeUserList(_selectedCnt);
                _currentTimer = _selectedTimer;
                currentCon = _conList[Random().nextInt(_conList.length-1)] + _conList[Random().nextInt(_conList.length-1)] ;
                print(_selectedCnt);
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => new PlayInGame1()),
                );
                print('game1');
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
              Container(
                  padding: EdgeInsets.only(top: 30),
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
        ),
      )
    );
  }
}

class Game1Option extends StatefulWidget{
 const Game1Option({Key? key}) : super(key: key);

  @override
  Game1OptionMenu createState() => Game1OptionMenu();
}

class PlayInGame1 extends StatelessWidget {
  const PlayInGame1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InGame1(),
    );
  }
}

class InGame1 extends StatefulWidget{
  const InGame1({Key? key}) : super(key: key);

  @override
  InGame1View createState() => InGame1View();
}
//게임 진행 필요요소
var _currentTimer;
List<User>? user;
String? currentCon;


//게임 실행 창
class InGame1View extends State<InGame1>{

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
    if(time == -100){
      return  Text(' ',
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

  void start() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        isPlaying = true;
        if(time > 0)
          time--;
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

  void pass(){
    setState((){
      time = _currentTimer;
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
                Text('Player $currentUser GameOver!')
              ],
            ),
            actions: [
              new FlatButton(
                  child: new Text("다시하기"),
                  onPressed:(){
                    Navigator.pop(context);
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Game1()),
                    );
          },
              ),
            ],
          );
        });
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
                    context, MaterialPageRoute(builder: (context) => Game1()),
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

  //게임내 필요요소
  int currentUser = 1;
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

  void NextUser(){
    setState((){
      if(user!.length - 1 < currentUser) {
        currentUser = 0;
      }
      currentUser++;
    });
  }


  @override
  Widget build(BuildContext context){
   return WillPopScope(
       onWillPop: (){
     return _onBackKey();
   },
    child: Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          children: [
            Row(children: [
              Icon(Icons.timer,
              size: 50),
              Container(
                width: 40,
                child:TimerTxt(),
              ),
              Container(
                padding: EdgeInsets.only(left:50),
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
                Image.asset("assets/images/board.png"),
                Positioned(
                  top:45,
                    left: 100,
                    child: Text('$currentCon',
                  style: TextStyle(
                    fontSize: 90,
                    color: Colors.white,
                  ),
                ))
              ],
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Stack(
                children: [
                  Image.asset('assets/images/user.png'),
                  Positioned(
                    top:230,
                    left: 120,
                    child: Row(
                      children: [ Text('Player $currentUser',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                  ),
                    ])
            )
                ],
              ),
            ),
            TextButton.icon(onPressed: () {
              if(isPlaying) {
                NextUser();
                pass();
              }
            },
              label: Text("Next",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              icon: Icon(
                Icons.chevron_right,
                size: 50,
                color: Colors.black,
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 30),
                  elevation: 20,
                  primary: Colors.lightGreenAccent[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ],
        ),
      ),
   )
   );
  }
}

class User{
  User(int index){
    this.index = index;
  }
  int index = 0;
}

List<User> makeUserList(int n){
  List<User> mkuList = [User(1)];
  for(int i = 2; i <= n; i++){
   mkuList.add(User(i));
  }
  return mkuList;
}

