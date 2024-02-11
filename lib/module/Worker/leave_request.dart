
// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:property_managment/button.dart';
import 'package:property_managment/components/app_bar.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/components/string.dart';
import 'package:get/get.dart';
import 'package:property_managment/components/text_field.dart';
import 'package:property_managment/module/Worker/congrats_screen.dart';
  
class LeaveRequest extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "Leave Request"),
      body: leaveRequesteWidget(context),
    );
    
  }

  Widget leaveRequesteWidget(context){
    return SingleChildScrollView(
      child: Container(
         height: Get.height,
        width: Get.width,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), 
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:Text(
                 Constants.leave_type, style:headingTextStyle(context, PRIMARY_COLOR,) ,
                )
              ),  
              SizedBox(height: 20),      
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child:CustomTextField(
                  
                  // textController: controller,
                  readOnly: false,
                  hintText: Constants.email,
                  hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                  // validator: FormValidator.titleValidator
                )
              ),
              SizedBox(height: 20), 
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:Text(
                 "Add A Description", style:headingTextStyle(context, PRIMARY_COLOR, )
                )
              ),
              SizedBox(height: 20),
              Container(
                width: Get.width/0.8,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                  // color: grey_Input,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0)
                  )
                ),
                child: CustomTextField(
                  
                  keyboardType: TextInputType.multiline,
                  autoFocus: false,
                  enabled: true,
                  cursorColor: PRIMARY_COLOR,
                  readOnly: false,
                  maxLine: 10,
                  // maxLength:   3000,
                  hintText: "tittle",
                  // textcolor:  certificate_text,
                  hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                  errorText: '',
                  // textController: _summaryController,
                  onFieldSubmitted: (val){},
                  onChanged: (val){
                    
                  },
                  validator: ((val)=> val.isEmpty ?  "Please fill the filed" : null),
                  onSaved: (newVal){}
                ),
              ),
              SizedBox(height: 40),
              Row(
               
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child:Text(
                      "FROM", style:headingTextStyle(context,PRIMARY_COLOR ) ,
                    )
                  ),
                  SizedBox(width: 155,),
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    child: Text("01/06/2019", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),)
                  ),
                  SizedBox(width: 3,),
                  Icon(  
              Icons.calendar_month,  
              size: 20,  
              color:Color(0xff593D77)  
            ),  
                ]
              ),
              SizedBox(height: 20),
              Row(
                
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,),
                    child:Text(
                      "TO", style:headingTextStyle(context,PRIMARY_COLOR ) ,
                    )
                  ),
                  SizedBox(width: 180,),
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    child: Text("01/06/2019", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),)
                  ),
                  SizedBox(width: 3,),
                  Icon(  
              Icons.calendar_month,  
              size: 20,  
              color:Color(0xff593D77)  
            ),  


                ]
              ),
            SizedBox(height: 48,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
                child: shadowButton(
                  Constants.pswd_rest_btn,60,  PRIMARY_COLOR,                
                  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CongratsScreen()),
                  );
    
                  },double.infinity,PRIMARY_COLOR.withOpacity(0.20), 
                )
              ),
              
             
            ],
          ),
        ),
      ),
    );

  }
}