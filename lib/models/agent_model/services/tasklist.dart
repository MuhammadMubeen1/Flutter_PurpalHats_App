import 'dart:convert';
Mytask? mytaskFromJson(String str) => Mytask.fromJson(json.decode(str));
String mytaskToJson(Mytask? data) => json.encode(data!.toJson());
class Mytask {
    Mytask({
        this.status,
        this.reponseType,
        this.responseMessage,
        this.data,
    });

    String? status;
    String? reponseType;
    String? responseMessage;
    Data? data;

    factory Mytask.fromJson(Map<String, dynamic> json) => Mytask(
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
      required  this.tasks,
    });

    List<Task> tasks;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tasks: json["tasks"] == null ? [] : List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tasks": tasks == null ? [] : List<dynamic>.from(tasks.map((x) => x.toJson())),
    };
}

class Task {  
    Task({
        this.id,
        this.agentId,
        this.maintenanceRequestId,
        this.name,
        this.status,
        this.description,
        this.requestDate,
        this.startedDate,
        this.completedDate,
        this.remarks,
        this.assignTime,
        this.priority,
        this.poNo,
        this.createdAt,
        this.updatedAt,
        this.propertyId,
        this.property,
        this.maintenanceRequest,
    });

    int? id;
    int? agentId;
    int? maintenanceRequestId;
    String? name;
    String? status;
    dynamic description;
    DateTime? requestDate;
    DateTime? startedDate;
    DateTime? completedDate;
    String? remarks;
    dynamic assignTime;
    int? priority;
    dynamic poNo;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? propertyId;
    Property? property;
    MaintenanceRequest? maintenanceRequest;

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        agentId: json["agent_id"],
        maintenanceRequestId: json["maintenance_request_id"],
        name: json["name"],
        status: json["status"],
        description: json["description"],
        requestDate: DateTime.parse(json["request_date"]),
        startedDate: DateTime.parse(json["started_date"]),
        completedDate: DateTime.parse(json["completed_date"]),
        remarks: json["remarks"],
        assignTime: json["assign_time"],
        priority: json["priority"],
        poNo: json["po_no"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        propertyId: json["property_id"],
        property: Property.fromJson(json["property"]),
        maintenanceRequest: MaintenanceRequest.fromJson(json["maintenance_request"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agent_id": agentId,
        "maintenance_request_id": maintenanceRequestId,
        "name": name,
        "status": status,
        "description": description,
        "request_date": "${requestDate!.year.toString().padLeft(4, '0')}-${requestDate!.month.toString().padLeft(2, '0')}-${requestDate!.day.toString().padLeft(2, '0')}",
        "started_date": startedDate?.toIso8601String(),
        "completed_date": completedDate?.toIso8601String(),
        "remarks": remarks,
        "assign_time": assignTime,
        "priority": priority,
        "po_no": poNo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "property_id": propertyId,
        "property": property!.toJson(),
        "maintenance_request": maintenanceRequest!.toJson(),
    };
}

class MaintenanceRequest {
    MaintenanceRequest({
        this.id,
        this.tenantId,
        this.propertyId,
        this.isAllow,
        this.entryPermission,
        this.status,
        this.title,
        this.description,
        this.requestDate,
        this.visitDate,
        this.isSurveyDone,
        this.surveyRating,
        this.surveyDescription,
        this.createdAt,
        this.updatedAt,
        this.tenant,
    });

    int? id;
    int? tenantId;
    int? propertyId;
    bool? isAllow;
    String? entryPermission;
    String? status;
    String? title;
    String? description;
    DateTime? requestDate;
    DateTime? visitDate;
    bool? isSurveyDone;
    int? surveyRating;
    String? surveyDescription;
    DateTime? createdAt;
    DateTime? updatedAt;
    Tenant? tenant;

    factory MaintenanceRequest.fromJson(Map<String, dynamic> json) => MaintenanceRequest(
        id: json["id"],
        tenantId: json["tenant_id"],
        propertyId: json["property_id"],
        isAllow: json["is_allow"],
        entryPermission: json["entry_permission"],
        status: json["status"],
        title: json["title"],
        description: json["description"],
        requestDate: DateTime.parse(json["request_date"]),
        visitDate: DateTime.parse(json["visit_date"]),
        isSurveyDone: json["is_survey_done"],
        surveyRating: json["survey_rating"],
        surveyDescription: json["survey_description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        tenant  : Tenant.fromJson(json["tenant"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tenant_id": tenantId,
        "property_id": propertyId,
        "is_allow": isAllow,
        "entry_permission": entryPermission,
        "status": status,
        "title": title,
        "description": description,
        "request_date": "${requestDate!.year.toString().padLeft(4, '0')}-${requestDate!.month.toString().padLeft(2, '0')}-${requestDate!.day.toString().padLeft(2, '0')}",
        "visit_date": "${visitDate!.year.toString().padLeft(4, '0')}-${visitDate!.month.toString().padLeft(2, '0')}-${visitDate!.day.toString().padLeft(2, '0')}",
        "is_survey_done": isSurveyDone,
        "survey_rating": surveyRating,
        "survey_description": surveyDescription,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "tenant": tenant!.toJson(),
    };
}

class Tenant {
    Tenant({
        this.address,
        this.name,
        this.email,
        this.type,
        this.city,
        this.unit,
        this.streetName,
        this.streetNo,
        this.phase,
        this.zip,
        this.state,
        this.mobile,
        this.location,
    });

    String? address;
    String? name;
    String? email;
    String? type;
    dynamic city;
    dynamic unit;
    dynamic streetName;
    dynamic streetNo;
    dynamic phase;
    dynamic zip;
    dynamic state;
    String? mobile;
    dynamic location;

    factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        address: json["address"],
        name: json["name"],
        email: json["email"],
        type: json["type"],
        city: json["city"],
        unit: json["unit"],
        streetName: json["street_name"],
        streetNo: json["street_no"],
        phase: json["phase"],
        zip: json["zip"],
        state: json["state"],
        mobile: json["mobile"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
        "email": email,
        "type": type,
        "city": city,
        "unit": unit,
        "street_name": streetName,
        "street_no": streetNo,
        "phase": phase,
        "zip": zip,
        "state": state,
        "mobile": mobile,
        "location": location,
    };
}

class Property {
    Property({
        this.address,
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
        this.updatedAt,
    });

    String? address;
    int? id;
    int? tenantId;
    String? title;
    dynamic description;
    int? phase;
    int? unit;
    String? city;
    String? streetName;
    int? streetNo;
    String? state;
    String? zip;
    dynamic location;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Property.fromJson(Map<String, dynamic> json) => Property(
        address: json["address"],
        id: json["id"],
        tenantId: json["tenant_id"],
        title: json["title"],
        description: json["description"],
        phase: json["phase"],
        unit: json["unit"],
        city: json["city"],
        streetName: json["street_name"],
        streetNo: json["street_no"],
        state: json["state"],
        zip: json["zip"],
        location: json["location"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "id": id,
        "tenant_id": tenantId,
        "title": title,
        "description": description,
        "phase": phase,
        "unit": unit,
        "city": city,
        "street_name": streetName,
        "street_no": streetNo,
        "state": state,
        "zip": zip,
        "location": location,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
