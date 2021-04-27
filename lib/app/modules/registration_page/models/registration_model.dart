class RegistrationModel {
  bool status;
  RegData data;
  String message;

  RegistrationModel({this.status, this.data, this.message});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new RegData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class RegData {
  String token;

  RegData({this.token});

  RegData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
