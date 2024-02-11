

// ignore_for_file: non_constant_identifier_names, unnecessary_cast, deprecated_member_use



import 'package:flutter/material.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/default_size.dart';

//Use defaultSize to set height and width of widgets
DefaultSize defaultSize = DefaultSize();

///Use this Height in [SizedBox]
double HEIGHT_1 = defaultSize.screenHeight * .03;
double HEIGHT_2 = defaultSize.screenHeight * .05;
double HEIGHT_3 = defaultSize.screenHeight * .06;
double HEIGHT_4 = defaultSize.screenHeight * .07;
double HEIGHT_5 = defaultSize.screenHeight * .1;

double WIDTH_1 = defaultSize.screenWidth * .03;
double WIDTH_2 = defaultSize.screenWidth * .05;
double WIDTH_3 = defaultSize.screenWidth * .06;
double WIDTH_4 = defaultSize.screenWidth * .07;
double WIDTH_5 = defaultSize.screenWidth * .1;
double WIDTH_6 = defaultSize.screenWidth * .2;

///Use this padding while using [EdgeInsets.symmetric(horizontal: )]
double HORIZONTAL_PADDING = defaultSize.screenWidth * .05;

EdgeInsets DEFAULT_HORIZONTAL_PADDING = EdgeInsets.symmetric(
  horizontal: HORIZONTAL_PADDING,
);

//Border Radius Of Button
BorderRadius BORDER_CIRCULAR_RADIUS = BorderRadius.circular(
  defaultSize.screenWidth * .03,
);

///Use this [TextStyle] for Headings
TextStyle? headingTextStyle(BuildContext context, colorText) {
  return Theme.of(context).textTheme.headline4?.copyWith(
    // fontSize: defaultSize,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: colorText
  );
}
TextStyle? boldTextStyle(BuildContext context, texttColor, double fontttSize) {
  return Theme.of(context).textTheme.headline4?.copyWith(
    // fontSize: defaultSize.screenWidth * .065,
    fontWeight: FontWeight.w700,
    
    fontSize: fontttSize,
    color: texttColor, 
    fontFamily:'Sk-Modernis'
  );
}

///Use this [TextStyle] for subTitles
TextStyle? subTitleTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.headline4?.copyWith(
        // fontSize: defaultSize.screenWidth * .055,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );
}

///Use this [TextStyle] for simple text
TextStyle? labelTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyText1?.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      fontFamily: "Sk-Modernist",
      color: PRIMARY_COLOR,
      letterSpacing: 0.1,
      );
}
TextStyle? textStyleTextStyle(BuildContext context, colorrs) {
  return Theme.of(context).textTheme.bodyText1?.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 13,
      fontFamily: "Sk-Modernist",
      color: colorrs,
      // letterSpacing: 0.1,
      );
}
///Use this [TextStyle] for hint text
TextStyle? hintTextStyle(BuildContext context,color) {
  return Theme.of(context).textTheme.bodyText1?.copyWith(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: 'Sk-Modernist',
    fontSize: 13,
    color: color,
    // letterSpacing: 0.1,
  );
}
TextStyle? cardTextStyle(BuildContext context,color) {
  return Theme.of(context).textTheme.bodyText1?.copyWith(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: 'Sk-Modernist',
    fontSize: 15,
    color: color,
    // letterSpacing: 0.1,
  );
}
TextStyle? hintCongrs(BuildContext context,) {
  return Theme.of(context).textTheme.bodyText1?.copyWith(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: 'Sk-Modernist',
    fontSize: 19.94,
    color: INPUT_FIELD_TEXT_COLOR,
    // letterSpacing: 0.1,
  );
}
TextStyle? highltedTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyText1?.copyWith(
        // fontSize: defaultSize.screenWidth * .04,
        fontWeight: FontWeight.w700,
        fontFamily: 'Sk-Modernist',
        color: GREY_COLOR_,
        fontSize: 14,
        // letterSpacing: 0.1,
      );
}

///Use this [TextStyle] for button text
TextStyle? buttonTextStyle(BuildContext context, {color,FontWeight? fontWeight, fontSize}) {
  return Theme.of(context).textTheme.bodyText2?.copyWith(
    fontSize: defaultSize.screenWidth * .045,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 0.1,
      );
}

//RegEx for Email
RegExp getEmailRegExp() {
  return RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
}

//RegEx for Name
RegExp getFullNameExp() {
  return RegExp(r"^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}$");
}

//RegEx for Phone Number
RegExp getPhoneNumberExp() {
  return RegExp(r"^(?:[+0]9)?[0-9]$");
}

//RegEx for Phone Number
RegExp getUsernameExp() {
  return RegExp(r"^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$");
}

//Vertical SizedBox Between Widgets
SizedBox SB_BY_4 = SizedBox(
  height: HEIGHT_1 / 4,
);
SizedBox SB_Half = SizedBox(
  height: HEIGHT_1 / 2,
);
SizedBox SB_1H = SizedBox(
  height: HEIGHT_1,
);
SizedBox SB_2H = SizedBox(
  height: HEIGHT_2,
);
SizedBox SB_3H = SizedBox(
  height: HEIGHT_3,
);
SizedBox SB_4H = SizedBox(
  height: HEIGHT_4,
);
SizedBox SB_5H = SizedBox(
  height: HEIGHT_5,
);

//Horizontal SizedBox Between Widgets
SizedBox SB_BY_4W = SizedBox(
  width: WIDTH_1 / 4,
);
SizedBox SB_1W = SizedBox(
  width: WIDTH_1,
);
SizedBox SB_2W = SizedBox(
  width: WIDTH_2,
);
SizedBox SB_3W = SizedBox(
  width: WIDTH_3,
);
SizedBox SB_4W = SizedBox(
  width: WIDTH_4,
);
SizedBox SB_5W = SizedBox(
  width: WIDTH_5,
);
SizedBox SB_6W = SizedBox(
  width: WIDTH_6,
);

//Navigator Key will be used to routing
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();