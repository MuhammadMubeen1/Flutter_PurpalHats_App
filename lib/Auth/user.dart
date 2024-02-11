import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_managment/models/tanent_login_model.dart';
import 'package:property_managment/module/sign_in.dart';
import 'package:property_managment/module/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../module/Tanent/home_screen.dart';
import '../module/Worker/home_view.dart';

class SatatePersistence {
  void LoginAuth() async {
    //  Get current  Value from SharedPerference  Strage Here .....
    SharedPreferences storage = await SharedPreferences.getInstance();
    final userType =
        await storage.getString('userType'); // Get user Type here...
    final name = await storage.getString('name'); //get current user name..
    final email = await storage.getString('email'); //get current user email..
    final userId =
        await storage.getString('userId'); //get current user userId..
    print('$userId - $userType - $name - $email');/// user info...here

    
    //Used Snack bar check User type here ....
    Get.snackbar('checking user type from shared preferences',
        userType ?? 'user type is null');
    //Used Check! thet check user type here then navigate screen....
    if (userType == 'agent') {
      // get current agent user info  from SharedPderferecen go to agent screen
      Get.to(AgentScreen(name: name, email: email, userId: userId));
    } else if (userType == 'tenant') {
      // get current tenant user info  from SharedPderferecen go to tanentScreen
      Get.to(TanentHomeScreen(name: name, email: email, userId: userId));
    } else {
      /// if get null vallue go to signin screen
      Get.to(() => SignIN());
    }
  }
}

