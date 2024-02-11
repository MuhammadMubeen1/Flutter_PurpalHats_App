import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:property_managment/models/tanent_login_model.dart';
import 'package:property_managment/utils/constant.dart';
import 'dart:convert' as convert;
import 'package:property_managment/utils/rest_connector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAPI {
  Future<TanentModel?> login(
      String username, String password, String deviceToken) async {
    final url = BaseURL;
    try {
      Response response = await RestConnector(
          url: url,
          requestType: "POST",
          data: convert.jsonEncode({
            "email": username,
            "password": password,
            'device_token': deviceToken,
          })).getData();
      SharedPreferences storage = await SharedPreferences.getInstance();
      final user = TanentModel.fromJson(response.data);
      return user;
    } catch (e) {
      return null;
    }
  }
}
