class CableProviderModel {
  bool? success;
  String? message;
  List<Data>? data;

  CableProviderModel({this.success, this.message, this.data});

  CableProviderModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? provider;
  String? icon;
  int? minAmount;
  int? maxAmount;

  Data({this.name, this.provider, this.icon, this.minAmount, this.maxAmount});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    provider = json['provider'];
    icon = json['icon'];
    minAmount = json['min_amount'];
    maxAmount = json['max_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['provider'] = this.provider;
    data['icon'] = this.icon;
    data['min_amount'] = this.minAmount;
    data['max_amount'] = this.maxAmount;
    return data;
  }
}
