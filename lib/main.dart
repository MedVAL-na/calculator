import 'package:flutter/material.dart';
import 'package:calculator/widgets/calculator_button.dart';

void main() {
  runApp(Calculator());
}
class Calculator extends StatefulWidget{
  Calculator({Key? key}) : super( );

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State <Calculator> {
  late int firstnum;
  late int secondnum;
  late String history = "";
  late String TextTodisplay = "";
  late String res;
  late String operation;

  void buttonOnClick(String buttonValue){
    print(buttonValue);
    if (buttonValue == 'C') {
      TextTodisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '';
    } else if (buttonValue == 'AC') {
        TextTodisplay = '';
        firstnum = 0;
        secondnum = 0;
        res = '';
        history = '';
      } else if (buttonValue == '+/-'){
      if(TextTodisplay[0] != '-') {
        res = '-'+ TextTodisplay;
      } else {
        res = TextTodisplay.substring(1);
      }
    } else if (buttonValue =='<'){
      res = TextTodisplay.substring(0, TextTodisplay.length-1);
    }
    else if ( buttonValue == '/' || buttonValue == 'x'
        || buttonValue == '-'|| buttonValue == '+') {
        firstnum = int.parse(TextTodisplay);
        res = '';
        operation = buttonValue;
      } else if (buttonValue == '=') {
      secondnum = int.parse(TextTodisplay);
      if (operation == '+') {
        res = (firstnum + secondnum).toString();
        history = firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == '-') {
        res = (firstnum - secondnum).toString();
        history = firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == 'x') {
        res = (firstnum * secondnum).toString();
        history = firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == '/') {
        res = (firstnum / secondnum).toString();
        history = firstnum.toString() + operation.toString() + secondnum.toString();
      }
    } else {
      res = int.parse(TextTodisplay + buttonValue).toString();
    }
    setState(() {
      TextTodisplay = res;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF61002f),
          centerTitle: true,
          title: Text("Simple calculator",
              style: TextStyle(color: Color(0xFFffd4ed)),),
        ),
        backgroundColor: Color( 0xFFa38192),
        body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: TextStyle(fontSize: 30, color: Color(0x6661002f)),
                  ),
                ),
                alignment: Alignment.topRight ,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    TextTodisplay,
                    style: TextStyle(fontSize: 40, color: Color(0xFF61002f)),
                  ),
                ),
                alignment: Alignment.topRight ,
              ),
              Row(
                children: [
                  CalculatorButton('AC',0xFF61002f,0xFFffd4ed, 25, buttonOnClick  ),
                  CalculatorButton('C',0xFF61002f,0xFFffd4ed, 25, buttonOnClick  ),
                  CalculatorButton('<',0xFF61002f,0xFFffd4ed, 30, buttonOnClick ),
                  CalculatorButton('/', 0xFF61002f,0xFFffd4ed, 25, buttonOnClick ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton('9', 0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('8',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('7',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('x',0xFF61002f,0xFFffd4ed, 25, buttonOnClick ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton('6',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('5',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('4',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('-',0xFF61002f,0xFFffd4ed, 50, buttonOnClick ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton('3',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('2',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('1',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('+',0xFF61002f,0xFFffd4ed, 25, buttonOnClick ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton('+/-',0xFF61002f,0xFFffd4ed, 25, buttonOnClick ),
                  CalculatorButton('0',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('00',0xFFd93d9a,0xFF000000, 25, buttonOnClick ),
                  CalculatorButton('=',0xFF61002f,0xFFffd4ed, 25, buttonOnClick ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
