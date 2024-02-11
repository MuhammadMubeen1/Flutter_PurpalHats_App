import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/utils/constant.dart';

import '../models/agent_model/services/listapi_services.dart';
import '../models/agent_model/services/maintence_request.dart';

  class MiantenceReq {
    Future<MaintenanceRequestClass> submitMaintenanceRequest(
        {required BuildContext context,
        required String sessionid,
        required String property_id,
        required String visit_date,
        required String title,
        required String description,
        required String entry_permission}) async {
      MaintenanceRequest? maingetservices;
      try {
        http.Response userRes = await http.post(
          Uri.parse(Maintainapi),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode({
            "login_session_id": "182",
            "property_id": "15",
            "visit_date": "2023-01-16",
            "title": "Fix my floor",
            "description": "From postman API",
            "entry_permission": "yes_with_any_time"
          }),
        );
        print(userRes.body);
        if (userRes.statusCode == 201 || userRes.statusCode == 200) {
          var mylist = maintenanceRequestFromJson(userRes.body);
          maingetservices = mylist;
          print("Data posted successfully");
          // code to handle success
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.white,
            duration: Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Server error....',
              style: TextStyle(color: Color(0xff593D77)),
            ))); ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.white,
            duration: Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Please Wait......',
              style: TextStyle(color: Color(0xff593D77)),
            )));
          print("Error posting data, status code: ${userRes.statusCode}");
          // code to handle error
        }
        // if (userRes.statusCode == 200) {
        //   var mylist = maintenanceRequestFromJson(userRes.body);

        //   // var data=mytaskToJson(userRes.body);
        //   maingetservices = mylist;
        // }
      } catch (e) {
        print(e.toString());
        print("Maintence Not Found");
        // showSnackBar(context, e.toString());

      }

      return maingetservices!.data!.maintenanceRequest!;
    }
  }
