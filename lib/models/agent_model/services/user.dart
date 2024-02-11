import 'dart:convert';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

class Payload {
    Payload({
        required this.status,
        required this.reponseType,
        required this.responseMessage,
        required this.data,
    });

    String status;
    String reponseType;
    String responseMessage;
    Data data;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        status: json["status"],
        reponseType: json["reponse_type"],
        responseMessage: json["response_message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "reponse_type": reponseType,
        "response_message": responseMessage,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.userId,
        required this.name,
        required this.email,
        required this.userType,
        required this.loginSession,
    });

    int userId;
    String name;
    String email;
    String userType;
    LoginSession loginSession;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        userType: json["user_type"],
        loginSession: LoginSession.fromJson(json["login_session"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "user_type": userType,
        "login_session": loginSession.toJson(),
    };
}

class LoginSession {
    LoginSession({
        required this.id,
        required this.userId,
        required this.fcmToken,
        required this.deviceToken,
        this.device,
        this.brand,
        this.model,
        this.os,
        this.osVersion,
        required this.status,
        required this.updatedAt,
        required this.createdAt,
    });

    int id;
    int userId;
    String fcmToken;
    String deviceToken;
    dynamic device;
    dynamic brand;
    dynamic model;
    dynamic os;
    dynamic osVersion;
    String status;
    DateTime updatedAt;
    DateTime createdAt;

    factory LoginSession.fromJson(Map<String, dynamic> json) => LoginSession(
        id: json["id"],
        userId: json["user_id"],
        fcmToken: json["fcm_token"],
        deviceToken: json["device_token"],
        device: json["device"],
        brand: json["brand"],
        model: json["model"],
        os: json["os"],
        osVersion: json["os_version"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "fcm_token": fcmToken,
        "device_token": deviceToken,
        "device": device,
        "brand": brand,
        "model": model,
        "os": os,
        "os_version": osVersion,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
