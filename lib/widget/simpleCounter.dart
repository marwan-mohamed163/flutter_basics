import 'package:flutter/material.dart';

class simpleCounter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return counterState();
  }
}

class counterState extends State<simpleCounter>{
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('counter $counter'),
          FloatingActionButton(onPressed:onCounter,
          child:Icon(Icons.add),),
        ],
      ),
    );
  }
  void onCounter(){
    setState(() {
      counter++;
    });
}
}
