// To parse this JSON data, do
//
//     final bankListModel = bankListModelFromJson(jsonString);

import 'dart:convert';

BankListModel bankListModelFromJson(String str) =>
    BankListModel.fromJson(json.decode(str));

String bankListModelToJson(BankListModel data) => json.encode(data.toJson());

class BankListModel {
  bool success;
  String message;
  List<Datum> data;

  BankListModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BankListModel.fromJson(Map<String, dynamic> json) => BankListModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String code;
  String name;
  dynamic isMobileVerified;
  dynamic branches;
  bool? isCashPickUp;

  Datum({
    required this.id,
    required this.code,
    required this.name,
    this.isMobileVerified,
    this.branches,
    this.isCashPickUp,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        isMobileVerified: json["isMobileVerified"],
        branches: json["branches"],
        isCashPickUp: json["isCashPickUp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "isMobileVerified": isMobileVerified,
        "branches": branches,
        "isCashPickUp": isCashPickUp,
      };
}
