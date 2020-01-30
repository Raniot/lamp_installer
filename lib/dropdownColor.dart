import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownColor extends StatelessWidget{
  final Color color;
  final String colorText;
  
  const DropdownColor({
    this.color,
    this.colorText
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(color: color, width: 10, height: 10,),
      Text(colorText)
    ],);
  }
}