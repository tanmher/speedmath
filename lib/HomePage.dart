import 'package:flutter/material.dart';
import 'screens/text_section.dart';
import 'package:speedmath/style.dart';
import 'package:hexcolor/hexcolor.dart';
import 'MenuPage.dart';
import 'dart:io';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/SpeedMathLogo.png', width: 125.0, height: 125.0, fit: BoxFit.cover,),
            TextTitle('Speed Math'),
            Padding(padding: EdgeInsets.only(top: 50),),
            ButtonTheme(
              minWidth: 250,
              height: 50,
              child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  },
                  color: HexColor('#2d9cdb'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  child: Container(
                    child: Text('S T A R T', style: TextStyle(fontSize: BodyTextSize, fontFamily: 'Questrial', color: Colors.white)),
                  ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10),),
            ButtonTheme(
              minWidth: 250,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => exit(0)),
                  );
                },
                color: HexColor('#ffffff'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                    side: BorderSide(color: HexColor('#2d9cdb'))
                ),
                child: Container(
                  child: Text('Q U I T', style: TextStyle(fontSize: BodyTextSize, fontFamily: 'Questrial', color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}