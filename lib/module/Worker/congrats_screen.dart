
// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_managment/module/Worker/task_detail.dart';
  
class CongratsScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: congratsWidget(context),
    );
  }

  Widget congratsWidget(context){
    return Padding(
      padding: const EdgeInsets.only(top: 107),
      child: Column(
        children: [ 
          SvgPicture.asset(Constants.CONGRATS_IMG,),
SizedBox(height: 10,),
          Text(
            Constants.gr8_job, 
            style: boldTextStyle(context, WHITE_COLOR, 35),
          ),
       SizedBox(height: 14,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              Constants.gr8_job_TEXT, 
              textAlign: TextAlign.center,
              style: hintCongrs(context,),
            ),
          ),
          SizedBox(height: 80,),
        Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                child: shadowButton(
                  Constants.close, 60, PRIMARY_COLOR,                
                  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetail()),
                  );

                  },double.infinity,WHITE_COLOR, 
                )
              ),
        ]
      ),
    );

  }
    
}