import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_managment/models/task_list_model.dart';
import 'dart:convert' as convert;
import 'package:property_managment/utils/constant.dart';
import 'package:property_managment/utils/rest_connector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/agent_model/services/tasklist.dart';

class TaskAPI {
  Future<TaskModel?> taskPost(
    data,
  ) async {
    const url = TaskList;
    try {
      Response? response = await RestConnector(
          url: url,
          requestType: "POST",
          data: convert.jsonEncode({"login_session_id": '144'})).getData();
      print(response.data);
      final user = TaskModel.fromJson(response.data);
      print(
          "..................................user of the profile API........$user");

      return user;
    } catch (e) {
      print(".................................CTACH ERROR........$e");
      return null;
    }
  }
}

class Taskservices {
  Future<List<Task>> gettask(BuildContext context, String sessionid) async {
    Mytask? getalltask;
    try {
      http.Response userRes = await http.post(
        Uri.parse(TaskList),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({"login_session_id": '153'}),
      );
      print(userRes.body);
      if (userRes.statusCode == 200) {
        var mydata = mytaskFromJson(userRes.body);

        // var data=mytaskToJson(userRes.body);
        getalltask = mydata;
      }
    } catch (e) {
      print(e.toString());
      print("task Not Found");
      // showSnackBar(context, e.toString());

    }

    return getalltask!.data!.tasks;
  }
}


// class Tasklist {
//  static Future<List<Mytask>> getaltask() async {
//     var url = Uri.parse(
//         'https://mkefn47qx3.execute-api.ap-southeast-1.amazonaws.com/pro/tasks/list');
//     var response = await http.post(url);
//     log('Response body:${response.body}');
//     print('Response status:${response.statusCode}');
//       Map data =jsonDecode(response.body);
//       List tasktemplist=[];
//       for(var v in data["data"])
//       {
//         tasktemplist.add(v.toString());
//       log(v.toString());
//       print(data['data'].length.toString());


//       }
//       return Mytask.fromJson();
//   } 
// }
