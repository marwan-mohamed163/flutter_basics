// ignore_for_file: file_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/widget/CalculatorButton.dart';
import 'package:my_app/widget/CalculatorTextResult.dart';

class CalculatorState extends State<CalculatorWedgit> {
  String resultTv = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: CalculatorTextResult(resultTv)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton('7', addDigit),
              CalculatorButton('8', addDigit),
              CalculatorButton('9', addDigit),
              CalculatorButton('-', onOperatorClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton('4', addDigit),
              CalculatorButton('5', addDigit),
              CalculatorButton('6', addDigit),
              CalculatorButton('+', onOperatorClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton('1', addDigit),
              CalculatorButton('2', addDigit),
              CalculatorButton('3', addDigit),
              CalculatorButton('*', onOperatorClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton('.', addDigit),
              CalculatorButton('0', addDigit),
              CalculatorButton('=', onEqualClick),
              CalculatorButton('/', onOperatorClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton('clear', onOperatorClick),

            ],
          ),
        ),
      ],
    );
  }

  void onDigtClick() {

  }

  void addDigit(String digit) {
    setState(() {
      resultTv += digit;
    });
  }

  String operator = '';
  String res = '';

  void onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      res = resultTv;
      this.operator = clickedOperator;
      setState(() {
        resultTv = '';
      });
    } else {
      //res is not empty and operator is not empty
      //1- calculate new result
      //2- and save new Clicked operator
      res =calculate(res,operator,resultTv);
          this.operator=clickedOperator;
          setState(() {
            resultTv='';
          });
    }
  }
  String calculate(String RHS,String operator,String LHS) {
    double n1 = double.parse(LHS);
    double n2 = double.parse(RHS);
    double res = 0.0;

    if (operator == '+') {
      res = n1 + n2;
    } else if (operator == '-') {
      res = n1 - n2;
    } else if (operator == '*') {
      res = n1 * n2;
    } else if (operator == '/') {
      res = n1 / n2;
    }
    if (operator=='clear'){
      res=0.0;
    }
    return res.toString();
  }
  void onEqualClick(String Text){
    res=calculate(res, operator,resultTv);
setState(() {
  resultTv=res;
  res='';
  operator='';
});
  }
}





class CalculatorWedgit extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return
        CalculatorState();
  }
}