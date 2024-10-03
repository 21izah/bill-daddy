// To parse this JSON data, do
//
//     final airtimeBundleModel = airtimeBundleModelFromJson(jsonString);

import 'dart:convert';

AirtimeBundleModel airtimeBundleModelFromJson(String str) =>
    AirtimeBundleModel.fromJson(json.decode(str));

String airtimeBundleModelToJson(AirtimeBundleModel data) =>
    json.encode(data.toJson());

class AirtimeBundleModel {
  bool? success;
  String? message;
  List<Datum>? data;

  AirtimeBundleModel({
    this.success,
    this.message,
    this.data,
  });

  factory AirtimeBundleModel.fromJson(Map<String, dynamic> json) =>
      AirtimeBundleModel(
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
  int? price;
  String? shortname;
  String? dataCode;

  Datum({
    this.name,
    this.price,
    this.shortname,
    this.dataCode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        price: json["price"],
        shortname: json["shortname"],
        dataCode: json["data_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "shortname": shortname,
        "data_code": dataCode,
      };
}
