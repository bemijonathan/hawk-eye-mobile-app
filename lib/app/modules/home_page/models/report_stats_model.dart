class ReportStats {
  bool status;
  Data data;
  String message;

  ReportStats({this.status, this.data, this.message});

  ReportStats.fromJson(Map<String, dynamic> json) {
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
  int allreport;
  int myreport;
  int myAlert;

  Data({this.allreport, this.myreport, this.myAlert});

  Data.fromJson(Map<String, dynamic> json) {
    allreport = json['allreport'];
    myreport = json['myreport'];
    myAlert = json['myAlert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allreport'] = this.allreport;
    data['myreport'] = this.myreport;
    data['myAlert'] = this.myAlert;
    return data;
  }
}
