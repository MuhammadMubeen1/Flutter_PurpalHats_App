
// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/app_bar.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:property_managment/module/Worker/my_task.dart';
import 'package:property_managment/module/Worker/task_detail_2.dart';

import '../../models/agent_model/services/tasklist.dart';
  
class TaskDetail extends StatelessWidget {
  // const TaskDetail({Key key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    Mytask();
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "Tasks Details"),
      body: taskDailsWidget(context),
    );
    
  }

  Widget taskDailsWidget(context){
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [  
              SizedBox(height: 20), 
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:Text(
                 Constants.window_repair, style:headingTextStyle(context, blackText,) ,
                )
              ), 
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:Text(
                  Constants.description, style:hintTextStyle(context, blackText) ,
                )
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:Text(
                 Constants.lorem_ipsum, style:hintTextStyle(context, INPUT_FIELD_TEXT_COLOR) ,
                )
              ), 
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(color: PRIMARY_COLOR, indent: 20, endIndent: 10, thickness: 2,)
                  ), 
                  Text(Constants.info),
                  Expanded(
                    child: Divider(color: PRIMARY_COLOR, indent: 10, endIndent:20, thickness: 2,)
                  ),
                ]
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(Constants.tanent, style: textStyleTextStyle(context, PRIMARY_COLOR),),
                        SizedBox(height: 10),
                        Text(Constants.address, style: textStyleTextStyle(context, PRIMARY_COLOR)  ),
                        SizedBox(height: 10),
                        Text(Constants.phone, style: textStyleTextStyle(context, PRIMARY_COLOR)),
                        SizedBox(height: 10),
                        Text(Constants.email,style: textStyleTextStyle(context, PRIMARY_COLOR)),
      
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("John Doe", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),),
                        SizedBox(height: 10),
                        Text("Apart # 101 Oregon, 945368 CA", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)  ),
                        SizedBox(height: 10),
                        Text("+1 111 0222 33", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                        SizedBox(height: 10),
                        Text("johndoe@gmail.com",style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
      
                      ]
                    )
                  )
                ]
              ),
              SizedBox(height: 40),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(color: PRIMARY_COLOR, indent: 20, endIndent: 10, thickness: 2,)
                  ), 
                  Text(Constants.time),
                  Expanded(
                    child: Divider(color: PRIMARY_COLOR, indent: 10, endIndent:20, thickness: 2,)
                  ),
                ]
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(Constants.Request_Date, style: textStyleTextStyle(context, PRIMARY_COLOR),),
                        SizedBox(height: 10),
                        Text(Constants.Request_Time, style: textStyleTextStyle(context,PRIMARY_COLOR)),
                        SizedBox(height: 10),
                        Text(Constants.Due_Date, style: textStyleTextStyle(context, PRIMARY_COLOR)),
                        SizedBox(height: 10),
                        Text(Constants.due_time, style: textStyleTextStyle(context, PRIMARY_COLOR)),
                        
      
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(Constants.tanent, style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),),
                        SizedBox(height: 10),
                        Text(Constants.address, style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)  ),
                        SizedBox(height: 10),
                        Text(Constants.phone, style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                        SizedBox(height: 10),
                        Text(Constants.email,style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
      
                      ]
                    )
                  )
                ]
              ),
              // Button()
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 120),
                child: shadowButton(
                  Constants.task_strt, 60, PRIMARY_COLOR,                
                  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetail2()));
      
                  },double.infinity,PRIIMARY_BASIC, 
                )
              )
              
             
            ],
          ),
        ),
      ),
    );

  }
}