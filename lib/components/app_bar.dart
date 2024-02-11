// ignore_for_file: prefer_const_constructors, missing_required_param

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/stripe_payment.dart';
import 'package:property_managment/module/Tanent/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar buildNavigationBar(context, textString) {



  
  return AppBar(
    centerTitle: true, 
    elevation: 0,
    automaticallyImplyLeading: false,
    
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: ()async{


         SharedPreferences storage = await SharedPreferences.getInstance();
   // Get user Type here...
    final name = await storage.getString('name'); //get current user name..
    final email = await storage.getString('email'); //get current user email..
     //
        Get.to(TanentHomeScreen(email: email, name: name, userId: 'user_id',));
      },
      icon: Icon(Icons.arrow_back),  color: PRIMARY_COLOR, iconSize: 22,), 
    
    title: Text(
      textString, 
      style: const TextStyle(
        color: PRIMARY_COLOR,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 16.0, 
        fontFamily: 'Sk-Modernist'
      )
    )
  );
}