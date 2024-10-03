// To parse this JSON data, do
//
//     final airtimeProviderModel = airtimeProviderModelFromJson(jsonString);

import 'dart:convert';

AirtimeProviderModel airtimeProviderModelFromJson(String str) =>
    AirtimeProviderModel.fromJson(json.decode(str));

String airtimeProviderModelToJson(AirtimeProviderModel data) =>
    json.encode(data.toJson());

class AirtimeProviderModel {
  bool? success;
  String? message;
  List<Datum>? data;

  AirtimeProviderModel({
    this.success,
    this.message,
    this.data,
  });

  factory AirtimeProviderModel.fromJson(Map<String, dynamic> json) =>
      AirtimeProviderModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? name;
  String? provider;
  String? icon;

  Datum({
    this.name,
    this.provider,
    this.icon,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        provider: json["provider"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "provider": provider,
        "icon": icon,
      };
}
