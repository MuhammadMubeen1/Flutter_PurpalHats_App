// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_declarations

import 'package:dio/dio.dart';
import 'dart:convert' as convert;

import 'package:property_managment/utils/constant.dart';
import 'package:property_managment/utils/rest_connector.dart';

class SeekerLogout {
  tanentLogout(userID) async {
    final url = BaseURL +"logout";
    try {
      Response? response = await RestConnector(
        url: url,
        requestType: "POST",
        data: convert.jsonEncode({
          "login_session_id": userID,
        })
      ).getData();
      return response.data;
      // final user = User.fromJson(response.data);
      // return user;
      } catch (e) {
      return null;
    }
  }
}