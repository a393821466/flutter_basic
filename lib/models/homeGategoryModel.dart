class HomeGategoryModel {
  bool success;
  HomeDataModel data;

  HomeGategoryModel({this.success, this.data});

  HomeGategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data =
        json['data'] != null ? new HomeDataModel.fromJson(json['data']) : null;
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

class HomeDataModel {
  List<BannerModel> banner;
  List<CategoryList> categoryList;

  HomeDataModel({this.banner, this.categoryList});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = new List<BannerModel>();
      json['banner'].forEach((v) {
        banner.add(new BannerModel.fromJson(v));
      });
    }
    if (json['categoryList'] != null) {
      categoryList = new List<CategoryList>();
      json['categoryList'].forEach((v) {
        categoryList.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    if (this.categoryList != null) {
      data['categoryList'] = this.categoryList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerModel {
  int id;
  String imgUrl;

  BannerModel({this.id, this.imgUrl});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}

class CategoryList {
  int id;
  String imgUrl;
  String content;

  CategoryList({this.id, this.imgUrl, this.content});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['content'] = this.content;
    return data;
  }
}
