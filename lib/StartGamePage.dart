import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speedmath/MenuPage.dart';


class StartGamePage extends StatefulWidget {
  StartGamePage({Key key, this.title, this.value}) : super(key: key);
  final String title;
  final int value;

  @override
  _StartGamePageState createState() => _StartGamePageState();
}

class _StartGamePageState extends State<StartGamePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [

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