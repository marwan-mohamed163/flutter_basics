import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widget/Calculator.dart';
import 'package:my_app/widget/ListViewExapleScreen.dart';
import 'package:my_app/widget/NewsCatagoriesImages.dart';
import 'package:my_app/widget/Practicse.dart';
import 'package:my_app/widget/TitleTextWidget.dart';
import 'package:my_app/widget/simpleCounter.dart';

void main(){
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello in My New App'),
        ),
      body:
          MyScreen()

      ),

    );
  }
  
}