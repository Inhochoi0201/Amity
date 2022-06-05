import 'package:flutter/material.dart';
import 'package:amity_project/selectmenu.dart';
import 'dart:math';
import 'dart:async';

import 'package:flutter/services.dart';

class Game3 extends StatelessWidget{
  const Game3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: "몸으로 말해요",
      debugShowCheckedModeBanner: false,
      home: Game3Option(),
    );
  }
}

class Game3Option extends StatefulWidget {
  const Game3Option({Key? key}) : super(key: key);

  @override
  Game3OptionMenu createState() => Game3OptionMenu();
}

class Game3OptionMenu extends State<Game3Option>{
  final List<String>_ListCon = ['동물', '음식', '스포츠', '랜덤'];
  final List<String> _ListAnimal = ['캥거루','코알라','하마','토끼','쥐','판다','호랑이','사자','원숭이','뱀'
    ,'거북이','말','늑대','낙타','치타','고양이','악어','소','고릴라','기린','거위','햄스터','수달','코뿔소','다람쥐','물개','도마뱀','사슴','펭귄','딱따구리','부엉이','앵무새'
  ,'고슴도치','여우','개구리','타조','돼지','돌고래','상어','오리','양','닭','독수리','백조','까치','곰','두더지','나무늘보','귀뚜라미','토끼','나비','달팽이','사마귀','스컹크','이구아나','모기',
  '코끼리','플라밍고','바퀴벌레','벌','고라니'];
  final List<String> _ListFood = ['닭발','회','마라탕','브라우니','피자','연어','막창','과일','치킨','타꼬야끼','껍데기','초밥','비빔밥','버블티','김치찌개','냉면','국수','새우','갈비','삼겹살','햄버거'
  ,'조개구이','떡','쫄면','붕어빵','샤브샤브','호떡','떡볶이','마카롱','카레','돈가스','스테이크','만두','케이크','아이스\n아메리카노','사과','딸기','포도','오이','짜장면','수박','참외','방울\n토마토',
    '민트초코','엄마는\n외계인','아몬드\n봉봉','코카콜라','맥주','피자','소주','파인애플','오렌지','레몬','상추','김치','치즈스틱','감자튀김'];
  final List<String> _ListSports = ['축구','야구','피구','피겨\n스케이팅','스키','스노보드','미식축구','리듬체조','마라톤','탁구','테니스','배드민턴','농구','봅슬레이','수영','배구','복싱',
    '핸드볼','비치\n발리볼','사격','사이클','서핑','스케이트\n보드','스켈레톤','스키점프','승마','아이스\n하키','소프트볼','양궁','역도','유도','컬링','태권도','검도','합기도','펜싱','풋살','다이빙','쿵푸'
  ,'씨름','도마','철봉','스쿼시','당구','골프','볼링','다트','수구','등산','줄다리기','경마','낚시','장기','체스','바둑','오목','오델로','포커'];

  final List<int> _timerList = [1,2,3];
  String _selectedCon = '동물';
  int _selectedTimer = 1;

  void chkList(){
    if(_selectedCon == '동물'){
      currentList = _ListAnimal;
    }else if(_selectedCon == '음식'){
      currentList = _ListFood;
    }else if(_selectedCon == '스포츠'){
      currentList = _ListSports;
    }else{
      List<String> _randList = [..._ListAnimal, ..._ListSports, ..._ListFood];
      currentList = _randList;
    }
  }
  void chkTime(){
    _currentTimer =  _selectedTimer * 60;
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
                  Image.asset("assets/images/mommal.png" ,width: 400, height: 250,),
                  Positioned(
                      top: 160,
                      left: 10,
                      child: Text("몸으로말해요",
                        style: TextStyle(
                          fontSize: 60,
                          backgroundColor: Colors.white,
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
                                      child: Text('$value 분',
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
                        ),
                        Row(
                          children: [
                            Text("주제   "
                              , style: TextStyle(
                                fontSize: 30,
                              ),),
                            Container(
                                width: 190,
                                padding: EdgeInsets.only(left: 20),
                                child:
                                DropdownButton(
                                  isExpanded: true,
                                  value: _selectedCon,
                                  items: _ListCon.map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text('$value',
                                        style: TextStyle(fontSize: 30),),);
                                  }).toList(),

                                  onChanged: (dynamic value){
                                    setState(() {
                                      _selectedCon = value;
                                    });
                                  },)
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top:60),

                          child: TextButton(onPressed: () {
                            SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
                             Navigator.push(
                              context, MaterialPageRoute(builder: (context) => new PlayInGame3()),
                            );
                             chkList();
                             chkTime();
                             currentList.shuffle();
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
                          padding: EdgeInsets.only(top: 40),
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

var currentList;
var _currentTimer; //타이머

class PlayInGame3 extends StatelessWidget {
  const PlayInGame3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InGame3(),
    );
  }
}

class InGame3 extends StatefulWidget{
  const InGame3({Key? key}) : super(key: key);

  @override
  InGame3View createState() => InGame3View();
}

//폭탄 게임 뷰
class InGame3View extends State<InGame3> {

  var _playIcon = Icons.play_arrow;
  var _playCol = Colors.grey;
  var _currentState = '시작';
  var correctCnt = 0;
  bool checkst = false;
  int i = 0;
  String con = currentList[0];
  int _correct =0;

  void incCorrect(){
    setState((){
      if(isPlaying)
        _correct++;
    });
  }
  void Next(){
    setState((){
      if(isPlaying) {
        if(currentList.length >= i) {
          i++;
          con = currentList[i];
        }
      }
    });
  }
  // 타이머 구성
  var time  = _currentTimer;
  Timer? timer;
  var isPlaying = false;

  double chkFontSize(){
    if(con.length == 4)
      return 150;
    else if(con.length >= 5)
      return 120;
    else
      return 200;
  }
  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

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
                    context, MaterialPageRoute(builder: (context) => Game3()),
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

  Widget GameTxt(){
    if(!checkst){
      return Text(' ',
        style: TextStyle(
          fontSize: chkFontSize(),
        ),);
    }else{
      return Text('$con',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: chkFontSize(),
        ));
    }
  }

  void start() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        isPlaying = true;
        if(time > 0) {
          time--;
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
                Text('정답: $_correct 개')
              ],
            ),
            actions: [
              new FlatButton(
                child: new Text("다시하기"),
                onPressed:(){
                  Navigator.pop(context);
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Game3()),
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
        checkst = true;
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

  @override
  Widget build(BuildContext context){
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          children: [
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
                padding: EdgeInsets.only(left: 100),
                child: Text('정답: $_correct 개',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),),
              ),
              Container(
                  padding: EdgeInsets.only(left: 200),
                  child:
                  IconButton(
                    onPressed: back,
                    icon: Icon(Icons.arrow_back,
                      color: Colors.greenAccent[400],),
                    iconSize: 30,
                  )),
            ],),
            Center(
              child: Container(
                height: 260,
                child: GameTxt(),)
            ),
            Positioned(
              child: Row(
                children: [
                  TextButton(onPressed: () {
                    incCorrect();
                    Next();
                  },
                    child: Text("정답",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        elevation: 10,
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 300),
                    child: TextButton(onPressed: () {
                      Next();
                    },
                      child: Text("PASS",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50),
                          elevation: 10,
                          primary: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        )
    );
  }
}
