// ignore_for_file: non_constant_identifier_names, unnecessary_question_mark

import 'package:json_annotation/json_annotation.dart';
part 'check_in_model.g.dart';
@JsonSerializable()
class CheckInModel {
  String? status;
  String? reponse_type;
  String? response_message;
  Data? data;
  CheckInModel(
  {this.status, this.reponse_type, this.response_message, this.data});
  factory CheckInModel.fromJson(json) {
    return _$CheckInModelFromJson(json);
  }
}
@JsonSerializable()
class Data {
  CheckInSession? check_in_session;
  Data({this.check_in_session});
  factory Data.fromJson(json) {
    return _$DataFromJson(json);
  
  }

}

@JsonSerializable()
class CheckInSession {
  int? id;
  int? user_id;
  int? check_in_session;
  int? login_session_id;
  dynamic? checkin_time;
  dynamic? checkout_time;
  List<dynamic>? checkin_location;
  dynamic? checkout_location;
  List<List>? tracking_locations;
  dynamic? status;
  dynamic? updatedAt;
  dynamic? createdAt;

  CheckInSession(
      {this.id,
      this.user_id,
      this.check_in_session,
      this.login_session_id,
      this.checkin_time,
      this.checkout_time,
      this.checkin_location,
      this.checkout_location,
      this.tracking_locations,
      this.status,
      this.updatedAt,
      this.createdAt});

  factory CheckInSession.fromJson(json) {
    return _$CheckInSessionFromJson(json);
  }
}

@JsonSerializable()
class TrackingLocations {
  TrackingLocations({dyn});

  factory TrackingLocations.fromJson(json) {
    return _$TrackingLocationsFromJson(json);
  }
}
