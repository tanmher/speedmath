import 'package:flutter/cupertino.dart';
import 'package:speedmath/style.dart';

class TextTitle extends StatelessWidget {
  final String _title;

  TextTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 24.0, 10.0),
      child: Text(_title, style: TextStyle(fontSize: LargeTextSize, fontFamily: 'Questrial', fontWeight: FontWeight.w600)),
    );
  }
}