import 'dart:convert';

MaintenanceApi? maintenanceapiFromJson(String str) => MaintenanceApi.fromJson(json.decode(str));
String maintenanceapiToJson(MaintenanceApi data) => json.encode(data.toJson());
class MaintenanceApi {
    MaintenanceApi({
        this.status,
        this.reponseType,
        this.responseMessage,
        this.data,
    });

    String? status;
    String? reponseType;
    String? responseMessage;
    Data? data;

    factory MaintenanceApi.fromJson(Map<String, dynamic> json) => MaintenanceApi(
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
      required  this.services,
    });

    List<Service> services;

    factory Data.fromJson(Map<String?, dynamic> json) => Data(
        services: json["services"] == null ? [] : List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "services": services == null ? [] : List<dynamic>.from(services.map((x) => x.toJson())),
    };
}

class Service {
    Service({
        this.id,
        this.name,
        this.image,
        this.price,
        this.payType,
        this.availabilityHours,
        this.quantity,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? image;
    int? price;
    String? payType;
    String? availabilityHours;
    int? quantity;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        payType: json["pay_type"],
        availabilityHours: json["availability_hours"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "pay_type": payType,
        "availability_hours": availabilityHours,
        "quantity": quantity,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
