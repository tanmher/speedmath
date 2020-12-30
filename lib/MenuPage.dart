import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedmath/style.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speedmath/HomePage.dart';
import 'MainGamePage.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

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
            Text('S E L E C T   O P E R A T I O N',
              style: TextStyle(fontSize: BodyTextSize, fontFamily: 'Questrial', fontWeight: FontWeight.w600, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            ButtonTheme(
              minWidth: 250,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainGamePage(title: 'A D D I T I O N',value: 1)),
                  );
                },
                color: HexColor('#ffffff'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    side: BorderSide(color: HexColor('#2d9cdb'))
                ),
                child: Container(
                  child: Text('Addition', style: TextStyle(fontSize:BodyTextSize, fontFamily: 'Questrial', color: Colors.black)),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            ButtonTheme(
              minWidth: 250,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainGamePage(title: 'S U B T R A C T I O N', value: 2)),
                  );
                },
                color: HexColor('#ffffff'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    side: BorderSide(color: HexColor('#2d9cdb'))
                ),
                child: Container(
                  child: Text('Subtraction', style: TextStyle(fontSize:BodyTextSize, fontFamily: 'Questrial', color: Colors.black)),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            ButtonTheme(
              minWidth: 250,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainGamePage(title: 'M U L T I P L I C A T I O N', value: 3)),
                  );
                },
                color: HexColor('#ffffff'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    side: BorderSide(color: HexColor('#2d9cdb'))
                ),
                child: Container(
                  child: Text('Multiplication', style: TextStyle(fontSize: BodyTextSize, fontFamily: 'Questrial', color: Colors.black)),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            ButtonTheme(
              minWidth: 250,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainGamePage(title: 'D I V I S I O N', value: 4)),
                  );
                },
                color: HexColor('#ffffff'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    side: BorderSide(color: HexColor('#2d9cdb'))
                ),
                child: Container(
                  child: Text('Division', style: TextStyle(fontSize: BodyTextSize, fontFamily: 'Questrial', color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: Icon(Icons.keyboard_arrow_left),
        backgroundColor: HexColor('#56ccf2'),
      ),
    );
  }
}