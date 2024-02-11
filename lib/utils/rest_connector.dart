import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/src/form_data.dart' as formdata;
import 'package:dio/src/response.dart' as resp;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestConnector {
  dynamic url;
  String requestType;
  String data;
  formdata.FormData? formData;
  String dataType;
  bool clearCookies;
  RestConnector(
      {required this.url,
      this.requestType = "POST",
      this.data = "",
      this.formData,
      this.dataType = "json",
      this.clearCookies = false});

  Future<resp.Response> getData() async {
  //  final prefs = await SharedPreferences.getInstance();
    try {
      Dio dio = Dio();
      RequestOptions requestOptions =
          RequestOptions(path: url, method: requestType);
      if (dataType == "json") {
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        String? fcmToken = GetStorage().read<String>("fcm_token");
        print("fcmtoken data send to rest connector .....$fcmToken");
        resp.Response response = await dio.request(
          url,
          data: data,
          options: Options(method: requestType, headers: {
            "Content-type": "application/json",
            "accept": "application/json",
            "device_token": fcmToken
          }),
        );
        return response;
      } else {
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };

        String? myToken = GetStorage().read<String>("myToken");
        myToken ??= "";
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          // data: formData,
          options: Options(method: requestType),
        );
        return response;
      }
    } on DioError catch (e) {
      if (Get.isDialogOpen!) Get.back();
      throw (e);
    } catch (e) {
      var x = e.toString();
      throw Exception();
    }
  }

  Future<resp.Response> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      Dio dio = Dio();
      RequestOptions requestOptions =
          RequestOptions(path: this.url, method: requestType);
      if (dataType == "json") {
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        String? myToken = prefs.getString('access_token');
        if (myToken == null) myToken = "";
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          options: Options(method: requestType, headers: {
            "accept": "application/json",
            "content-type": "application/json",
            "authorization": "Bearer $myToken"
          }),
          //options: cacheOptions,
        );
        return response;
      } else if (dataType == "VIDEO") {
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data"
        };
        String? myToken = GetStorage().read<String>("access_token");
        if (myToken == null) myToken = "";
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      } else {
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };

        String? myToken = GetStorage().read<String>("access_token");
        if (myToken == null) myToken = "";
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType, sendTimeout: 2000),
        );
        return response;
      }
    } on DioError catch (e) {
      if (Get.isDialogOpen!) Get.back();
      throw (e);
    } catch (e) {
      var x = e.toString();
      throw Exception();
    }
  }

  Future<resp.Response> postData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      Dio dio = Dio();
      RequestOptions requestOptions =
          RequestOptions(path: this.url, method: requestType);
      if (dataType == "json") {
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        String? myToken = prefs.getString('access_token');
        if (myToken == null) myToken = "";
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: data,
          options: Options(method: requestType, headers: {
            "accept": "application/json",
            "authorization": "Bearer $myToken"
          }),
          //options: cacheOptions,
        );
        return response;
      } else if (dataType == "VIDEO") {
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data"
        };
        String? myToken = GetStorage().read<String>("access_token");
        if (myToken == null) myToken = "";
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );

        return response;
      } else {
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        String? myToken = GetStorage().read<String>("access_token");
        if (myToken == null) myToken = "";
        requestOptions.headers["X-Csrf-Token"] = myToken;
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      }
    } on DioError catch (e) {
      if (Get.isDialogOpen!) Get.back();
      throw (e);
    } catch (e) {
      var x = e.toString();
      throw Exception();
    }
  }
}

