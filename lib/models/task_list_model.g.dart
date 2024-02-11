// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'task_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      status: json['status'],
      reponseType: json['reponseType'],
      responseMessage: json['responseMessage'],
      data: json['data'] == null ? null : Data.fromJson(json['data']),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'status': instance.status,
      'reponseType': instance.reponseType,
      'responseMessage': instance.responseMessage,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Tasks.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'tasks': instance.tasks,
    };

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      id: json['id'],
      agentId: json['agentId'],
      maintenance_request_id: json['maintenance_request_id'],
      name: json['name'],
      status: json['status'],
      description: json['description'],
      request_date: json['request_date'],
      started_date: json['started_date'],
      completed_date: json['completed_date'],
      remarks: json['remarks'],
      assign_time: json['assign_time'],
      priority: json['priority'],
      po_no: json['po_no'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      property_id: json['property_id'],
      property:
          json['property'] == null ? null : Property.fromJson(json['property']),
      maintenance_request: json['maintenance_request'] == null
          ? null
          : MaintenanceRequest.fromJson(json['maintenance_request']),
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'id': instance.id,
      'agentId': instance.agentId,
      'maintenance_request_id': instance.maintenance_request_id,
      'name': instance.name,
      'status': instance.status,
      'description': instance.description,
      'request_date': instance.request_date,
      'started_date': instance.started_date,
      'completed_date': instance.completed_date,
      'remarks': instance.remarks,
      'assign_time': instance.assign_time,
      'priority': instance.priority,
      'po_no': instance.po_no,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'property_id': instance.property_id,
      'property': instance.property,
      'maintenance_request': instance.maintenance_request,
    };

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      address: json['address'],
      id: json['id'],
      tenantId: json['tenantId'],
      title: json['title'],
      description: json['description'],
      phase: json['phase'],
      unit: json['unit'],
      city: json['city'],
      streetName: json['streetName'],
      streetNo: json['streetNo'],
      state: json['state'],
      zip: json['zip'],
      location: json['location'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'tenantId': instance.tenantId,
      'title': instance.title,
      'description': instance.description,
      'phase': instance.phase,
      'unit': instance.unit,
      'city': instance.city,
      'streetName': instance.streetName,
      'streetNo': instance.streetNo,
      'state': instance.state,
      'zip': instance.zip,
      'location': instance.location,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

MaintenanceRequest _$MaintenanceRequestFromJson(Map<String, dynamic> json) =>
    MaintenanceRequest(
      id: json['id'],
      tenant_id: json['tenant_id'],
      property_id: json['property_id'],
      is_allow: json['is_allow'] as bool?,
      entry_permission: json['entry_permission'],
      status: json['status'],
      title: json['title'],
      description: json['description'],
      request_date: json['request_date'],
      visit_date: json['visit_date'],
      is_survey_done: json['is_survey_done'] as bool?,
      survey_rating: json['survey_rating'],
      survey_description: json['survey_description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      tenant: json['tenant'] == null ? null : Tenant.fromJson(json['tenant']),
    );

Map<String, dynamic> _$MaintenanceRequestToJson(MaintenanceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenant_id,
      'property_id': instance.property_id,
      'is_allow': instance.is_allow,
      'entry_permission': instance.entry_permission,
      'status': instance.status,
      'title': instance.title,
      'description': instance.description,
      'request_date': instance.request_date,
      'visit_date': instance.visit_date,
      'is_survey_done': instance.is_survey_done,
      'survey_rating': instance.survey_rating,
      'survey_description': instance.survey_description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tenant': instance.tenant,
    };

Tenant _$TenantFromJson(Map<String, dynamic> json) => Tenant(
      address: json['address'],
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
      location: json['location'],
    );

Map<String, dynamic> _$TenantToJson(Tenant instance) => <String, dynamic>{
      'address': instance.address,
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
      'location': instance.location,
    };
