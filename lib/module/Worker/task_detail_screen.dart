
// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/app_bar.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:property_managment/module/Worker/leave_request.dart';

import '../../API/task_list_api.dart';
import '../../models/agent_model/services/tasklist.dart';
  
class TaskDetailScreen extends StatefulWidget {
  late final String name, description;

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final Taskservices ts = Taskservices();
   List<Task>? tasks = [];
  void initState() {
    super.initState();
    getalltask();

    ts.gettask(context, '144');
    // Tasklist.getaltask();
//  task.taskPost('144');
  }

  void getalltask() async {
    var task = await ts.gettask(context, '144');
    setState(() {
      tasks = task;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "Tasks Details"),
      body: taskDailsWidget(context),
    );
    
  }

  Widget taskDailsWidget(context){
    return ListView.builder(
      itemCount: tasks!.length,
      itemBuilder: (BuildContext context, int index) { 

       
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [  
            SizedBox(height: 20), 
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child:Text(
               tasks![index].name! , style:headingTextStyle(context,blackText ,) ,
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
               tasks![index].description.toString(), style:hintTextStyle(context, INPUT_FIELD_TEXT_COLOR) ,
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
                      Text(tasks![index].maintenanceRequest!.tenant!.name!, style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),),
                      SizedBox(height: 10),
                      Text(tasks![index].maintenanceRequest!.tenant!.location.toString(), style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)  ),
                      SizedBox(height: 10),
                      Text(tasks![index].maintenanceRequest!.tenant!.mobile!, style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                      SizedBox(height: 10),
                      Text(tasks![index].maintenanceRequest!.tenant!.email!,style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
    
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
                      Text(Constants.Request_Time, style: textStyleTextStyle(context, PRIMARY_COLOR)),
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
                      Text(tasks![index].requestDate.toString(), style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),),
                      SizedBox(height: 10),
                      Text(tasks![index].assignTime.toString(), style: hintTextStyle(context,INPUT_FIELD_TEXT_COLOR)  ),
                      SizedBox(height: 10),
                      Text(tasks![index].maintenanceRequest!.visitDate.toString(), style: hintTextStyle(context,INPUT_FIELD_TEXT_COLOR)),
                      SizedBox(height: 10),
                      Text(tasks![index].assignTime.toString(),style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
    
                    ]
                  )
                )
              ]
            ),
          
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(20, 0, 40, 120),
            //       child: shadowButton(
            //         Constants.ACCPT, 60,  GREEN_COLOR,                
            //         () {
            //           Navigator.push(context, MaterialPageRoute(builder: (context) => LeaveRequest()),
            //         );
    
            //         },Get.width/2.7,GREEN_BUTTON, 
            //       )
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(0, 0, 30, 120),
            //       child: shadowButton(
            //         Constants.reject, 60,REJECT_BUTTON,                
            //         () {
            //         //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfo()),
            //         // );
    
            //         },Get.width/2.7,REJECT_COLOR, 
            //       )
            //     ),
    
            //   ]
            // )
         
            
            
           
          ],
        ),
      );
      }
    );

  }
}