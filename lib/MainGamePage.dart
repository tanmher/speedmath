import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedmath/style.dart';
import 'package:hexcolor/hexcolor.dart';
import 'MenuPage.dart';
import 'dart:math';
import 'dart:ui';
import 'dart:core';
import 'dart:async';

class MainGamePage extends StatefulWidget{
  final String title;
  final int value;

  MainGamePage({Key key, this.value, this.title}): super(key: key);

  @override
  _MainGamePageState createState() => _MainGamePageState();
}

class _MainGamePageState extends State<MainGamePage> {

  int _counter = 10;
  int scoreCounter = 0;
  int answer = 0;
  String comp = '', startTryAgain = 'S T A R T';
  Random random = Random();
  int ans1=0, ans2=0, ans3=0;
  int fAns1 = 0,fAns2 =0,fAns3 = 0,fAns4 =0;
  bool _isVisible = false, _isVis = false;
  List<String> operation = ['ADDITION', 'SUBTRACTION', 'MULTIPLICATION', 'DIVISION'];
  var lst = [];

  Timer _timer;

  void showGame() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _computation() {
    int rand1 = random.nextInt(9)+1;
    int rand2 = random.nextInt(9)+1;
    int randD =  random.nextInt(9*2)+1;

    var randomPicker = List<int>.generate(3, (i) => (i+rand1)*2);

    setState(() {
      if(widget.value == 1){
        comp = '$rand1 + $rand2';
        answer = rand1 + rand2;

      }else if(widget.value == 2){
        int r = random.nextInt(4)+1;
        int r2 = random.nextInt(4)+1;
        rand1 *= r;
        rand2 *= r2;
        (rand1 > rand2) ? answer = rand1 - rand2 : answer = rand2 - rand1;
        (rand1 > rand2) ? comp = '$rand1 - $rand2' :comp = '$rand2 - $rand1';
      }
      else if(widget.value == 3){
        int r = random.nextInt(5)+1;
        randomPicker = randomPicker.map((e) => e*r).toList();
        comp = '$rand1 * $rand2';
        answer = rand1 * rand2;
      }else{
        int r = random.nextInt(9)+1;
        randomPicker = randomPicker.map((e) => e > 5 ? e - 4 : e).toList();
        double randNum1 = double.parse((randD).toStringAsFixed(2));
        double randNum2 = double.parse((randD).toStringAsFixed(2));
        int r1 = (randNum1*r).round();
        int r2 = (randNum2).round();
        comp = '$r1 / $r2';
        double ans = r1 / r2;
        answer = ans.round();
      }
      startTryAgain = 'T R Y  A G A I N';
      randomPicker.add(answer);
      for(int i=0; i<3; i++){
        (randomPicker[i] == answer) ? randomPicker[i] += 1 : randomPicker[i];
      }
      lst = randomPicker;
      lst.shuffle();
      fAns1 = lst[0];
      fAns2 = lst[1];
      fAns3 = lst[2];
      fAns4 = lst[3];
    });
  }

  void _startTimer() {
    _counter = 15;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          _isVisible = !_isVisible;
          _isVis = !_isVis;
        }
      });
    });
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: HexColor('#2d9cdb'),
      appBar: AppBar(
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Image.asset('assets/images/SpeedMathLogo.png', width: 36.0, height: 36.0, fit: BoxFit.cover,),
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Text('Speed Math'),
          ],),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Visibility(
              visible: _isVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 300.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: HexColor('#f2f2f2'),
                    ),
                    child:Center(
                      child: Text(widget.title,
                        style: TextStyle(fontSize: BodyTextSize, fontFamily: 'Questrial', fontWeight: FontWeight.w600, color:HexColor('#2f80ed')),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom:40.0),),
                  Center(
                    child: Text('$comp',
                      style: TextStyle(fontSize: MaxTextSize, fontFamily: 'Questrial',color: Colors.white),
                    ),
                  ),

                Padding(padding: EdgeInsets.only(bottom:40.0),),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    MaterialButton(
                      minWidth: 80,
                      height: 80,
                      child: Text('$fAns1',
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () => {
                        if(fAns1 == answer){
                          this.scoreCounter++,
                        },
                        _computation()
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),

                    MaterialButton(
                      minWidth: 80,
                      height: 80,
                      child: Text('$fAns2',
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () => {
                        if(fAns2 == answer){
                          scoreCounter++,
                        },
                        _computation()
                      },
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.only(top:10.0),),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 80,
                      height: 80,
                      child: Text('$fAns3',
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () => {
                        if(fAns3 == answer){
                          scoreCounter++,
                        },
                        _computation(),
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),

                    MaterialButton(
                      minWidth: 80,
                      height: 80,
                      child: Text('$fAns4',
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () => {
                        if(fAns4 == answer){
                          scoreCounter++,
                        },
                        _computation(),
                      },
                    ),
                  ],
                ),
              ],
              ),

            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Visibility(
                visible: _isVisible,
                child: Column(children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_alarm,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Text(
                        '$_counter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: GigaTextSize,
                          fontFamily: 'Questrial',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],)
            ),

            Visibility(visible: !_isVisible,
              child:Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 300.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: HexColor('#f2f2f2'),
                        ),
                        child:Center(
                          child: Text(widget.title,
                            style: TextStyle(fontSize: BodyTextSize, fontFamily: 'Questrial', fontWeight: FontWeight.w600, color:HexColor('#2f80ed')),
                          ),
                        ),
                      ),
                    ],
                  ),

                  (_counter > 0)
                      ? Text("")
                      : Column(children: [
                          Padding(padding: EdgeInsets.only(bottom: 80)),
                          Text("T O T A L  S C O R E",
                            style: TextStyle(fontSize: MediumTextSize, fontFamily: 'Questrial', color: Colors.white),
                          ),
                          Container(
                            padding: EdgeInsets.all(57.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                            child: Text('$scoreCounter',
                              style: TextStyle(fontSize: MaxTextSize, fontFamily: 'Questrial',color: Colors.black),
                            ),
                          ),
                  ],),
                  Padding(padding: EdgeInsets.only(bottom: 40)),
                  ButtonTheme(
                    minWidth: 250,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () => {_startTimer(), showGame(),_computation(),scoreCounter=0},
                      color: HexColor('#ffffff'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                      ),
                      child: Container(
                        child: Text('$startTryAgain', style: TextStyle(fontSize:BodyTextSize, fontFamily: 'Questrial', color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 50)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuPage()),
          );
        },
        child: Icon(Icons.keyboard_arrow_left),
        backgroundColor: HexColor('#56ccf2'),
      ),
    );
  }
}