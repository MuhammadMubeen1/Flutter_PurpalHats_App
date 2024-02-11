// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'check_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInModel _$CheckInModelFromJson(Map<String, dynamic> json) => CheckInModel(
      status: json['status'] as String?,
      reponse_type: json['reponse_type'] as String?,
      response_message: json['response_message'] as String?,
      data: json['data'] == null ? null : Data.fromJson(json['data']),
    );

Map<String, dynamic> _$CheckInModelToJson(CheckInModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reponse_type': instance.reponse_type,
      'response_message': instance.response_message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      check_in_session: json['check_in_session'] == null
          ? null
          : CheckInSession.fromJson(json['check_in_session']),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'check_in_session': instance.check_in_session,
    };

CheckInSession _$CheckInSessionFromJson(Map<String, dynamic> json) =>
    CheckInSession(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      check_in_session: json['check_in_session'] as int?,
      login_session_id: json['login_session_id'] as int?,
      checkin_time: json['checkin_time'],
      checkout_time: json['checkout_time'],
      checkin_location: json['checkin_location'] as List<dynamic>?,
      checkout_location: json['checkout_location'],
      tracking_locations: (json['tracking_locations'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList(),
      status: json['status'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );

Map<String, dynamic> _$CheckInSessionToJson(CheckInSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'check_in_session': instance.check_in_session,
      'login_session_id': instance.login_session_id,
      'checkin_time': instance.checkin_time,
      'checkout_time': instance.checkout_time,
      'checkin_location': instance.checkin_location,
      'checkout_location': instance.checkout_location,
      'tracking_locations': instance.tracking_locations,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };

TrackingLocations _$TrackingLocationsFromJson(Map<String, dynamic> json) =>
    TrackingLocations();

Map<String, dynamic> _$TrackingLocationsToJson(TrackingLocations instance) =>
    <String, dynamic>{};
