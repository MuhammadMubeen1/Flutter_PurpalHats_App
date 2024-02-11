import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Styles{
  static TextStyle appTextStyle(
    {double? fontSize, FontWeight? fontWeight, FontStyle? fontStyle, Color? color}) {
    return TextStyle(
      fontFamily: "Muli",
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color, 
      fontStyle: fontStyle,
    );
  }
}