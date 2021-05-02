class UserProfile {
  bool status;
  Data data;
  String message;

  UserProfile({this.status, this.data, this.message});

  UserProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String sId;
  String email;
  String phoneNumber;
  String firstName;
  String lastName;
  String createdAt;
  String updatedAt;
  int iV;
  double latitude;
  double longitude;
  List<Contacts> contacts;

  Data(
      {this.sId,
      this.email,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.latitude,
      this.longitude,
      this.contacts});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['contacts'] != null) {
      contacts = new List<Contacts>();
      json['contacts'].forEach((v) {
        contacts.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.contacts != null) {
      data['contacts'] = this.contacts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  String sId;
  String name;
  String email;
  String userId;
  int iV;
  String phone;

  Contacts({this.sId, this.name, this.email, this.userId, this.iV, this.phone});

  Contacts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    userId = json['userId'];
    iV = json['__v'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    data['phone'] = this.phone;
    return data;
  }
}
