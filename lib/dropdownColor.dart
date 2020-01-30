import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownColor extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String colorText;
  Color textColor;
  final double size = 10;


  DropdownColor({this.color1, this.color2, this.colorText});

  Color getTextColor() {
    if (this.color1 == Colors.transparent)
      return Colors.black;
    else
      return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: this.color1,
        gradient: new LinearGradient(
          colors: [this.color2, this.color1],
        ),
      ),
      child: Text(
          this.colorText,
          style: TextStyle(color: Colors.black),
        ),
    );   
  }
}



