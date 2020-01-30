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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: size,
                    width: size,
                    color: this.color1,
                  ),
                  Container(
                    height: size,
                    width: size,
                    color: this.color2,
                  ),
                ],
              ),
              Column(children: <Widget>[
                Container(
                  height: size,
                  width: size,
                  color: this.color2,
                ),
                Container(
                  height: size,
                  width: size,
                  color: this.color1,
                ),
              ])
            ],
          ),
        ),
        Text(
          this.colorText,
          style: TextStyle(color: getTextColor()),
        )
      ],
    );
  }
}
