import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:property_managment/utils/constant.dart';

import '../models/agent_model/services/listapi_services.dart';

class Services {
  Future<List<Service>> services(BuildContext context, String sessionid) async {
    MaintenanceApi? getservices;
    try {
      http.Response userRes = await http.post(
        Uri.parse(ListServices),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({"login_session_id":'181' }),
      );
      print(userRes.body);
      if (userRes.statusCode == 200) {
        var mylist = maintenanceapiFromJson(userRes.body);

        // var data=mytaskToJson(userRes.body);
        getservices = mylist;
      }
    } catch (e) {
      print(e.toString());
      print("List Not Found");
      // showSnackBar(context, e.toString());

    }

    return getservices!.data!.services;
  }
}
