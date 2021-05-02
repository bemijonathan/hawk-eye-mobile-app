class GetMyReportsModel {
  bool status;
  Data data;
  String message;

  GetMyReportsModel({this.status, this.data, this.message});

  GetMyReportsModel.fromJson(Map<String, dynamic> json) {
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
  List<Reports> reports;

  Data({this.reports});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['reports'] != null) {
      reports = [];
      json['reports'].forEach((v) {
        reports.add(new Reports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reports != null) {
      data['reports'] = this.reports.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reports {
  List<String> media;
  String sId;
  String title;
  String content;
  String userId;
  int iV;

  Reports(
      {this.media, this.sId, this.title, this.content, this.userId, this.iV});

  Reports.fromJson(Map<String, dynamic> json) {
    media = json['media'].cast<String>();
    sId = json['_id'];
    title = json['title'];
    content = json['content'];
    userId = json['userId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media'] = this.media;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    return data;
  }
}
