import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownColor extends StatelessWidget{
  final Color color;
  final String colorText;
  Color textColor;

  DropdownColor({
    this.color,
    this.colorText
  });

  Color getTextColor() {
    if(this.color == Colors.transparent)
      return Colors.black;
    else
      return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(color: this.color, width: 20, height: 20,),
      Text(this.colorText, style: TextStyle(color: getTextColor()),)
    ],);
    // return Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, color: this.color, child: Text(this.colorText),);
  }
}