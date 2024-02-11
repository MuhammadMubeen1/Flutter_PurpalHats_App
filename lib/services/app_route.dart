// ignore_for_file: constant_identifier_names, depend_on_referenced_packages, prefer_const_constructors


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:property_managment/module/Tanent/rent_payment.dart';

import '../components/dropdown.dart';
import '../components/stripe_payment.dart';
import '../module/Tanent/home_screen.dart';
import '../module/Tanent/internal_transfer.dart';
import '../module/Tanent/my_info.dart';
import '../module/Tanent/request_maintenance.dart';
import '../module/Worker/home_view.dart';
import '../module/Worker/my_task.dart';
import '../module/Worker/task_detail.dart';
import '../module/sign_in.dart';
import '../module/splash.dart';
part 'routes_page.dart';
class AppPages {
  static const INITIAL = Routes.HOME;
  static const DETAILRENT = Routes.RENTTDETAIL;
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page:
      
      () => 
       //MyInfo()
     // RentPayment(),
SplashScreen(),
      //HomeScreen(),
       //RentPayment(),
      //TanentHomeScreen(),
      //TaskDetail(),
    //SignIN()
     // Calander(),
     //InternalTransfer(),
      //MyInfo()
    // RequestMaintenance(),
      //RequestMaintenance(),
    //AgentScreen(),
       //MyTask()
      //SignIN(),
      //TanentHomeScreen(),
      //OpenContainerTransformDemo()
      //FadeThroughTransitionDemo()
      //TanentHomeScreen()
      //RentPayment(),
      
      //RentPayment()
      //MyInfo(''
      //InternalTransfer(),
      
      //TanentHomeScreen(),
      //AgentScreen(),
      //SignIN(),
  
      //SignUp(),
      //SplashScreen(),
      //CongratsScreen(),
      //AgentScreen(),
      //LeaveRequest(),
      //MyTask(),
      //TaskDetail2(),
      //TaskDetailScreen(),
      //TaskDetail(), 
      //ForgotScreen(),//SignIN(),
    ),

    GetPage(
      name: Routes.RENTTDETAIL,
      page: () => RentPayment(),
    ),
    
    
  ];
}
