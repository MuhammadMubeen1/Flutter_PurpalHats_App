// To parse this JSON data, do
//
//     final maintenanceRequest = maintenanceRequestFromJson(jsonString);

import 'dart:convert';

MaintenanceRequest? maintenanceRequestFromJson(String str) =>
    MaintenanceRequest.fromJson(json.decode(str));

String maintenanceRequestToJson(MaintenanceRequest? data) =>
    json.encode(data!.toJson());

class MaintenanceRequest {
  MaintenanceRequest({
    this.status,
    this.reponseType,
    this.responseMessage,
    this.data,
  });

  String? status;
  String? reponseType;
  String? responseMessage;
  Data? data;

  factory MaintenanceRequest.fromJson(Map<String, dynamic> json) =>
      MaintenanceRequest(
        status: json["status"],
        reponseType: json["reponse_type"],
        responseMessage: json["response_message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "reponse_type": reponseType,
        "response_message": responseMessage,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.maintenanceRequest,
  });

  MaintenanceRequestClass? maintenanceRequest;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        maintenanceRequest:
            MaintenanceRequestClass.fromJson(json["maintenance_request"]),
      );

  Map<String, dynamic> toJson() => {
        "maintenance_request": maintenanceRequest!.toJson(),
      };
}

class MaintenanceRequestClass {
  MaintenanceRequestClass({
    this.id,
    this.tenantId,
    this.propertyId,
    this.requestDate,
    this.visitDate,
    this.title,
    this.description,
    this.status,
    this.entryPermission,
    this.isAllow,
    this.updatedAt,
    this.createdAt,
  });

  int? id;
  int? tenantId;
  String? propertyId;
  DateTime? requestDate;
  DateTime? visitDate;
  String? title;
  String? description;
  String? status;
  String? entryPermission;
  bool? isAllow;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory MaintenanceRequestClass.fromJson(Map<String, dynamic> json) =>
      MaintenanceRequestClass(
        id: json["id"],
        tenantId: json["tenant_id"],
        propertyId: json["property_id"],
        requestDate: DateTime.parse(json["request_date"]),
        visitDate: DateTime.parse(json["visit_date"]),
        title: json["title"],
        description: json["description"],
        status: json["status"],
        entryPermission: json["entry_permission"],
        isAllow: json["is_allow"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tenant_id": tenantId,
        "property_id": propertyId,
        "request_date": requestDate?.toIso8601String(),
        "visit_date": visitDate?.toIso8601String(),
        "title": title,
        "description": description,
        "status": status,
        "entry_permission": entryPermission,
        "is_allow": isAllow,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
      };
}
