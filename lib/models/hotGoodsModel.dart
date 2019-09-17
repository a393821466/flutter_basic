class HotGoodsModel {
  bool success;
  HotGoodsDataModel data;

  HotGoodsModel({this.success, this.data});

  HotGoodsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? new HotGoodsDataModel.fromJson(json['data'])
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

class HotGoodsDataModel {
  List<HotPageData> hotPageData;
  int pages;
  int pageSizes;
  int pageCount;
  int allPage;

  HotGoodsDataModel(
      {this.hotPageData,
      this.pages,
      this.pageSizes,
      this.pageCount,
      this.allPage});

  HotGoodsDataModel.fromJson(Map<String, dynamic> json) {
    if (json['hotPageData'] != null) {
      hotPageData = new List<HotPageData>();
      json['hotPageData'].forEach((v) {
        hotPageData.add(new HotPageData.fromJson(v));
      });
    }
    pages = json['pages'];
    pageSizes = json['pageSizes'];
    pageCount = json['pageCount'];
    allPage = json['allPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotPageData != null) {
      data['hotPageData'] = this.hotPageData.map((v) => v.toJson()).toList();
    }
    data['pages'] = this.pages;
    data['pageSizes'] = this.pageSizes;
    data['pageCount'] = this.pageCount;
    data['allPage'] = this.allPage;
    return data;
  }
}

class HotPageData {
  int id;
  String goodsId;
  double price;
  double mallPrice;
  String name;
  String images;

  HotPageData(
      {this.id,
      this.goodsId,
      this.price,
      this.mallPrice,
      this.name,
      this.images});

  HotPageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goodsId'];
    price = json['price'];
    mallPrice = json['mallPrice'];
    name = json['name'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    data['mallPrice'] = this.mallPrice;
    data['name'] = this.name;
    data['images'] = this.images;
    return data;
  }
}
