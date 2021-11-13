import 'package:flutter/material.dart';
 class CalculatorButton extends StatelessWidget{
  String TextButton;
  Function onClick;
  CalculatorButton(this.TextButton,this.onClick);
  @override
  Widget build(BuildContext context) {
    return Expanded(child:
      Container(
      margin: EdgeInsets.all(1),
      child: ElevatedButton(onPressed:()=>
          onClick(TextButton),
          child: Text(TextButton,
              style:TextStyle(fontSize: 28))
      ),
    )
    );

  }
}