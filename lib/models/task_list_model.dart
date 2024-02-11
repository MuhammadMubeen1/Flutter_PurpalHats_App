// ignore_for_file: unnecessary_question_mark, non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'task_list_model.g.dart';

@JsonSerializable()
class TaskModel {
  dynamic? status;
  dynamic? reponseType;
  dynamic? responseMessage;
  Data? data;

  TaskModel({this.status, this.reponseType, this.responseMessage, this.data});

  factory TaskModel.fromJson(json) {
    return _$TaskModelFromJson(json);
  }
}

@JsonSerializable()
class Data {
  List<Tasks>? tasks;

  Data({this.tasks});

  factory Data.fromJson(json) {
    return _$DataFromJson(json);
  }
}

@JsonSerializable()
class Tasks {
  dynamic? id;
  dynamic? agentId;
  dynamic? maintenance_request_id;
  dynamic? name;
  dynamic? status;
  dynamic? description;
  dynamic? request_date;
  dynamic? started_date;
  dynamic? completed_date;
  dynamic? remarks;
  dynamic? assign_time;
  dynamic? priority;
  dynamic? po_no;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? property_id;
  Property? property;
  MaintenanceRequest? maintenance_request;

  Tasks(
      {this.id,
      this.agentId,
      this.maintenance_request_id,
      this.name,
      this.status,
      this.description,
      this.request_date,
      this.started_date,
      this.completed_date,
      this.remarks,
      this.assign_time,
      this.priority,
      this.po_no,
      this.createdAt,
      this.updatedAt,
      this.property_id,
      this.property,
      this.maintenance_request});

  factory Tasks.fromJson(json) {
    return _$TasksFromJson(json);
  }
}

@JsonSerializable()
class Property {
  dynamic? address;
  dynamic? id;
  dynamic? tenantId;
  dynamic? title;
  dynamic? description;
  dynamic? phase;
  dynamic? unit;
  dynamic? city;
  dynamic? streetName;
  dynamic? streetNo;
  dynamic? state;
  dynamic? zip;
  dynamic? location;
  dynamic? status;
  dynamic? createdAt;
  dynamic? updatedAt;

  Property(
      {this.address,
      this.id,
      this.tenantId,
      this.title,
      this.description,
      this.phase,
      this.unit,
      this.city,
      this.streetName,
      this.streetNo,
      this.state,
      this.zip,
      this.location,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory Property.fromJson(json) {
    return _$PropertyFromJson(json);
  }
}

@JsonSerializable()
class MaintenanceRequest {
  dynamic? id;
  dynamic? tenant_id;
  dynamic? property_id;
  bool? is_allow;
  dynamic? entry_permission;
  dynamic? status;
  dynamic? title;
  dynamic? description;
  dynamic? request_date;
  dynamic? visit_date;
  bool? is_survey_done;
  dynamic? survey_rating;
  dynamic? survey_description;
  dynamic? createdAt;
  dynamic? updatedAt;
  Tenant? tenant;

  MaintenanceRequest(
      {this.id,
      this.tenant_id,
      this.property_id,
      this.is_allow,
      this.entry_permission,
      this.status,
      this.title,
      this.description,
      this.request_date,
      this.visit_date,
      this.is_survey_done,
      this.survey_rating,
      this.survey_description,
      this.createdAt,
      this.updatedAt,
      this.tenant});

  factory MaintenanceRequest.fromJson(json) {
    return _$MaintenanceRequestFromJson(json);
  }
}

@JsonSerializable()
class Tenant {
  dynamic? address;
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
  dynamic? location;

  Tenant(
      {this.address,
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
      this.location});

  factory Tenant.fromJson(json) {
    return _$TenantFromJson(json);
  }
}
