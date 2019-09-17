class AnnountModel {
  bool success;
  List<AnnountDataModel> data;

  AnnountModel({this.success, this.data});

  AnnountModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<AnnountDataModel>();
      json['data'].forEach((v) {
        data.add(new AnnountDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnnountDataModel {
  int id;
  String title;
  String content;
  String createTime;

  AnnountDataModel({this.id, this.title, this.content, this.createTime});

  AnnountDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    return data;
  }
}
