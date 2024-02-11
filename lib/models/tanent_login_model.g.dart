// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tanent_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TanentModel _$TanentModelFromJson(Map<String, dynamic> json) => TanentModel(
      status: json['status'],
      reponse_type: json['reponse_type'],
      response_message: json['response_message'],
      data: json['data'] == null ? null : DataTanent.fromJson(json['data']),
    );

Map<String, dynamic> _$TanentModelToJson(TanentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reponse_type': instance.reponse_type,
      'response_message': instance.response_message,
      'data': instance.data,
    };

DataTanent _$DataTanentFromJson(Map<String, dynamic> json) => DataTanent(
      user_id: json['user_id'],
      name: json['name'],
      email: json['email'],
      user_type: json['user_type'],
      login_session: json['login_session'] == null
          ? null
          : LoginSession.fromJson(json['login_session']),
    );

Map<String, dynamic> _$DataTanentToJson(DataTanent instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'name': instance.name,
      'email': instance.email,
      'user_type': instance.user_type,
      'login_session': instance.login_session,
    };

LoginSession _$LoginSessionFromJson(Map<String, dynamic> json) => LoginSession(
      id: json['id'],
      user_id: json['user_id'],
      fcm_token: json['fcm_token'],
      device_token: json['device_token'],
      device: json['device'],
      brand: json['brand'],
      model: json['model'],
      os: json['os'],
      os_version: json['os_version'],
      status: json['status'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );

Map<String, dynamic> _$LoginSessionToJson(LoginSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'fcm_token': instance.fcm_token,
      'device_token': instance.device_token,
      'device': instance.device,
      'brand': instance.brand,
      'model': instance.model,
      'os': instance.os,
      'os_version': instance.os_version,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
