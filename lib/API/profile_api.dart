// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_declarations, unused_local_variable

import 'package:dio/dio.dart';
import 'package:property_managment/models/agent_model/profile_model.dart';
import 'dart:convert' as convert;
import 'package:property_managment/utils/constant.dart';
import 'package:property_managment/utils/rest_connector.dart';

class ProfileAPI {
  Future<ProfileModel?> agentProfile(data) async {
    final url = BaseURL + 'agents/get-profile';
    try {
      Response? response = await RestConnector(
          url: url,
          requestType: "POST",
          data: convert.jsonEncode({data})).getData();

      final user = ProfileModel.fromJson(response.data);
      print(
          "..................................user of the profile API........$user");

      return user;
    } catch (e) {
      print(".................................CTACH ERROR........$e");
      return null;
    }
  }
}
