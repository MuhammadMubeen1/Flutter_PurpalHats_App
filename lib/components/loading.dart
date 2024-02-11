
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/components/color.dart';

Widget loading() {
  return Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height:Get.height * 0.05,
            width:Get.width * 0.10,
            child: const CircularProgressIndicator(
              strokeWidth: 3,
              
              valueColor: AlwaysStoppedAnimation<Color>(PRIMARY_COLOR),
            ),
          ),
        ]
      ),
   );
  }