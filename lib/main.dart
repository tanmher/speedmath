import 'package:flutter/material.dart';
import 'package:speedmath/HomePage.dart';
import 'package:speedmath/style.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speed Math',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline6: AppBarTextStyle),
        ),
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'SpeedMath'),
    );
  }
}


