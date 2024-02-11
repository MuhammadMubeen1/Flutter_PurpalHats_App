// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_web_libraries_in_flutter, depend_on_referenced_packages, use_key_in_widget_constructors

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import '../Auth/user.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SatatePersistence state = SatatePersistence();// create class instance here ...
    Timer(Duration(seconds: 6), () // Used Time here .....
    async {    
      state.LoginAuth();  /// class StatePersistance Function called here........

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff593D77), body: SplashWidget());
  }

  Widget SplashWidget() {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ScaleAnimatedWidget.tween(      ////// Tween Animation Used here For Image ......
        duration: Duration(milliseconds: 2000),
        scaleDisabled: 0.5,
        scaleEnabled: 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 250,
                child: Image.asset(
                  'assets/svgs/purplehats.png', /// App Logo Used Here.....
                  color: Colors.white,
                  fit: BoxFit.fill,
                )),
          ],
        ),
      ),

     
    ]));
  }
}

      
    
