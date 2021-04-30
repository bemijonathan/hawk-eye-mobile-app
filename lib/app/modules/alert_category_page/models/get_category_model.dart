class GetAlertCategoryModel {
  bool status;
  List<GetCategoryData> data;
  String message;

  GetAlertCategoryModel({this.status, this.data, this.message});

  GetAlertCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new GetCategoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class GetCategoryData {
  String sId;
  String title;
  String slug;
  int iV;

  GetCategoryData({this.sId, this.title, this.slug, this.iV});

  GetCategoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['__v'] = this.iV;
    return data;
  }
}
