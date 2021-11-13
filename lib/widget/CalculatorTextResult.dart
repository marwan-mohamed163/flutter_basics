import 'package:flutter/material.dart';

class CalculatorTextResult extends StatelessWidget {
  String text;
  CalculatorTextResult(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(text
        ,textAlign:TextAlign.start ,style: TextStyle(fontSize: 28));

  }
}