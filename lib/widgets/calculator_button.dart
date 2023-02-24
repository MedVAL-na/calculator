import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget{
  final String text;
  final int FillColor;
  final int TextColor;
  final double FontSize;
  final Function callback;
  const CalculatorButton (
      this.text,
      this.FillColor,
      this.TextColor,
      this.FontSize,
      this.callback,
      );
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(5.0),
      child: SizedBox(
        width: 90,
        height: 90,
        child: ElevatedButton(
          onPressed: () => callback(text),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Color(FillColor)),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black45)
                  ))),
          child: Text(text,  style: TextStyle(color: Color(TextColor), fontSize: (FontSize)),),
        ),
      ),
    );
  }
}