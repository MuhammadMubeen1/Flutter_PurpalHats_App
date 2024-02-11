// ignore_for_file: unnecessary_question_mark, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  dynamic? status;
  dynamic? reponse_type;
  dynamic? response_message;
  DataProfile? data;

  ProfileModel(
      {this.status, this.reponse_type, this.response_message, this.data});
  factory ProfileModel.fromJson(json) {
    return _$ProfileModelFromJson(json);
  }
}

@JsonSerializable()
class DataProfile {
  Profilee? profile;

  DataProfile({this.profile});

  factory DataProfile.fromJson(json) {
    return _$DataProfileFromJson(json);
  }
}

@JsonSerializable()
class Profilee {
  dynamic? address;
  dynamic? profile_image;
  int? id;
  dynamic? name;
  dynamic? email;
  dynamic? type;
  dynamic? city;
  dynamic? unit;
  dynamic? street_name;
  dynamic? street_no;
  dynamic? phase;
  dynamic? zip;
  dynamic? state;
  dynamic? mobile;
  dynamic? gender;
  dynamic? dob;
  dynamic? location;
  dynamic? createdAt;
  dynamic? updatedAt;

  Profilee(
      {this.address,
      this.profile_image,
      this.id,
      this.name,
      this.email,
      this.type,
      this.city,
      this.unit,
      this.street_name,
      this.street_no,
      this.phase,
      this.zip,
      this.state,
      this.mobile,
      this.gender,
      this.dob,
      this.location,
      this.createdAt,
      this.updatedAt});

  factory Profilee.fromJson(json) {
    return _$ProfileeFromJson(json);
  }
}
