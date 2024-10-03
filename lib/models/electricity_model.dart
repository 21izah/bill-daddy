class ElectricityModel {
  bool? success;
  String? message;
  List<Data>? data;

  ElectricityModel({this.success, this.message, this.data});

  ElectricityModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic? name;
  dynamic? provider;
  dynamic? minimum;
  dynamic? maximum;
  dynamic? icon;

  Data({this.name, this.provider, this.minimum, this.maximum, this.icon});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    provider = json['provider'];
    minimum = json['minimum'];
    maximum = json['maximum'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['provider'] = this.provider;
    data['minimum'] = this.minimum;
    data['maximum'] = this.maximum;
    data['icon'] = this.icon;
    return data;
  }
}
