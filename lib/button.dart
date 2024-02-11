// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last, prefer_const_constructors, missing_required_param


import 'package:flutter/material.dart';
import 'package:property_managment/components/color.dart';

const fontRegular = 'Regular';
const fontMedium = 'Medium';
const fontSemibold = 'Semibold';
const fontBold = 'Bold';
/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 30.0;

Material buttonRounded(var name, double heigght, textColor, VoidCallback callbackFunction,  double width ,color) {
  return Material(
    elevation: 0,
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      width: width,
      height: heigght,
      child: OutlinedButton(
        child: text(
          name,
          fontSize: textSizeMedium,
          textColor: textColor,
          fontFamily: "Sk-Modernist",
        ),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        // side: BorderSide(color: Color(0XFFC6C6C6)),
          borderRadius: BorderRadius.circular(5.0)
      ),backgroundColor: color),
        onPressed: callbackFunction
      ),
    ),
  );
}

Material shadowButton(var name, double
 heigght, textColor, VoidCallback callbackFunction,
   double width ,color) {
  return Material(
    elevation: 0,
    borderRadius: BorderRadius.circular(3.0),
    child: Container(
      width: width,
      height: heigght,
      child: OutlinedButton(
        child: text(
          name,
          fontSize: textSizeMedium,
          textColor: textColor,
          fontFamily: "Sk-Modernist",
        ),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        // side: BorderSide(color: Color(0XFFC6C6C6)),
          borderRadius: BorderRadius.circular(3.0)
      ),backgroundColor: color),
        onPressed: callbackFunction
      ),
    ),
  );
}

 text(var text,
    {
      var fontSize = textSizeLargeMedium,
    textColor ,
    var fontFamily = fontRegular,
    var isCentered = false,
    // var maxLine = 1,
    }) {
    return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    // maxLines: maxLine,
    style: TextStyle(
      fontSize: fontSize,
      color: textColor,
        ),
  );
}