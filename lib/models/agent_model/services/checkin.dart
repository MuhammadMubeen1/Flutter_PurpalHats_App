import 'dart:convert';

CheckIn? checkInFromJson(String str) => CheckIn.fromJson(json.decode(str));

String checkInToJson(CheckIn? data) => json.encode(data!.toJson());

class CheckIn {
    CheckIn({
        this.status,
        this.reponseType,
        this.responseMessage,
        this.data,
    });

    String? status;
    String? reponseType;
    String? responseMessage;
    Data? data;

    factory CheckIn.fromJson(Map<String, dynamic> json) => CheckIn(
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
        this.checkInSession,
    });

    CheckInSession? checkInSession;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        checkInSession: CheckInSession.fromJson(json["check_in_session"]),
    );

    Map<String, dynamic> toJson() => {
        "check_in_session": checkInSession!.toJson(),
    };
}

class CheckInSession {
    CheckInSession({
        this.id,
        this.userId,
        this.loginSessionId,
        this.checkinTime,
        this.checkoutTime,
        this.checkinLocation,
        this.checkoutLocation,
        this.trackingLocations,
        this.status,
        this.updatedAt,
        this.createdAt,
    });

    int? id;
    int? userId;
    int? loginSessionId;
    DateTime? checkinTime;
    dynamic checkoutTime;
    List<dynamic>? checkinLocation;
    dynamic checkoutLocation;
    List<List<dynamic>?>? trackingLocations;
    String? status;
    DateTime? updatedAt;
    DateTime? createdAt;

    factory CheckInSession.fromJson(Map<String, dynamic> json) => CheckInSession(
        id: json["id"],
        userId: json["user_id"],
        loginSessionId: json["login_session_id"],
        checkinTime: DateTime.parse(json["checkin_time"]),
        checkoutTime: json["checkout_time"],
        checkinLocation: json["checkin_location"] == null ? [] : List<dynamic>.from(json["checkin_location"]!.map((x) => x)),
        checkoutLocation: json["checkout_location"],
        trackingLocations: json["tracking_locations"] == null ? [] : List<List<dynamic>?>.from(json["tracking_locations"]!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "login_session_id": loginSessionId,
        "checkin_time": checkinTime?.toIso8601String(),
        "checkout_time": checkoutTime,
        "checkin_location": checkinLocation == null ? [] : List<dynamic>.from(checkinLocation!.map((x) => x)),
        "checkout_location": checkoutLocation,
        "tracking_locations": trackingLocations == null ? [] : List<dynamic>.from(trackingLocations!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        "status": status,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
    };
}
