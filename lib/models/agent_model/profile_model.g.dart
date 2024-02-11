// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      status: json['status'],
      reponse_type: json['reponse_type'],
      response_message: json['response_message'],
      data: json['data'] == null ? null : DataProfile.fromJson(json['data']),
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reponse_type': instance.reponse_type,
      'response_message': instance.response_message,
      'data': instance.data,
    };

DataProfile _$DataProfileFromJson(Map<String, dynamic> json) => DataProfile(
      profile:
          json['profile'] == null ? null : Profilee.fromJson(json['profile']),
    );

Map<String, dynamic> _$DataProfileToJson(DataProfile instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };

Profilee _$ProfileeFromJson(Map<String, dynamic> json) => Profilee(
      address: json['address'],
      profile_image: json['profile_image'],
      id: json['id'] as int?,
      name: json['name'],
      email: json['email'],
      type: json['type'],
      city: json['city'],
      unit: json['unit'],
      street_name: json['street_name'],
      street_no: json['street_no'],
      phase: json['phase'],
      zip: json['zip'],
      state: json['state'],
      mobile: json['mobile'],
      gender: json['gender'],
      dob: json['dob'],
      location: json['location'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$ProfileeToJson(Profilee instance) => <String, dynamic>{
      'address': instance.address,
      'profile_image': instance.profile_image,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'type': instance.type,
      'city': instance.city,
      'unit': instance.unit,
      'street_name': instance.street_name,
      'street_no': instance.street_no,
      'phase': instance.phase,
      'zip': instance.zip,
      'state': instance.state,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'dob': instance.dob,
      'location': instance.location,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
