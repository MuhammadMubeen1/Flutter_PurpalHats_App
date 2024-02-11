// ignore_for_file: unnecessary_question_mark, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'tanent_login_model.g.dart';
@JsonSerializable()
class TanentModel {
  dynamic? status;
  dynamic? reponse_type;
  dynamic? response_message;
  DataTanent? data;
  TanentModel({this.status, this.reponse_type, this.response_message, this.data});
  factory TanentModel.fromJson(json){
    return _$TanentModelFromJson(json);
  }
}

@JsonSerializable()
class DataTanent {
  dynamic? user_id;
  dynamic? name;
  dynamic? email;
  dynamic? user_type;
  LoginSession? login_session;

  DataTanent({this.user_id, this.name, this.email, this.user_type, this.login_session});
  factory DataTanent.fromJson(json){
    return _$DataTanentFromJson(json);
  }
}

@JsonSerializable()
class LoginSession {
  dynamic? id;
  dynamic? user_id;
  dynamic? fcm_token;
  dynamic? device_token;
  dynamic? device;
  dynamic? brand;
  dynamic? model;
  dynamic? os;
  dynamic? os_version;
  dynamic? status;
  dynamic? updatedAt;
  dynamic? createdAt;

  LoginSession({
    this.id,
    this.user_id,
    this.fcm_token,
    this.device_token,
    this.device,
    this.brand,
    this.model,
    this.os,
    this.os_version,
    this.status,
    this.updatedAt,
    this.createdAt
  });
  factory LoginSession.fromJson(json){
    return _$LoginSessionFromJson(json);
  }

}