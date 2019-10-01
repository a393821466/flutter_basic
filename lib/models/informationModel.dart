class InformationModel {
  bool success;
  InfomationDataModel data;

  InformationModel({this.success, this.data});

  InformationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? new InfomationDataModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class InfomationDataModel {
  List<Content> content;
  int pages;
  int pageSizes;
  int allPage;

  InfomationDataModel({this.content, this.pages, this.pageSizes, this.allPage});

  InfomationDataModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = new List<Content>();
      json['content'].forEach((v) {
        content.add(new Content.fromJson(v));
      });
    }
    pages = json['pages'];
    pageSizes = json['pageSizes'];
    allPage = json['allPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
    }
    data['pages'] = this.pages;
    data['pageSizes'] = this.pageSizes;
    data['allPage'] = this.allPage;
    return data;
  }
}

class Content {
  int id;
  String title;
  String image;
  String contnet;
  String navText;
  int ratings;
  String createTime;

  Content(
      {this.id,
      this.title,
      this.image,
      this.contnet,
      this.navText,
      this.ratings,
      this.createTime});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    contnet = json['contnet'];
    navText = json['navText'];
    ratings = json['ratings'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['contnet'] = this.contnet;
    data['navText'] = this.navText;
    data['ratings'] = this.ratings;
    data['createTime'] = this.createTime;
    return data;
  }
}
