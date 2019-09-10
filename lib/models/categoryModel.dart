class CategoryModel {
  final int id;
  final String goodsId;
  final String goodsName;
  final double oriPrice;
  final double presentPrice;
  final String categoryId;
  final String categorySubId;
  final String images;
  final String description;
  CategoryModel(
      {this.id,
      this.goodsId,
      this.goodsName,
      this.oriPrice,
      this.presentPrice,
      this.categoryId,
      this.categorySubId,
      this.images,
      this.description});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        goodsId = json['goodsId'],
        goodsName = json['goodsName'],
        oriPrice = json['oriPrice'],
        presentPrice = json['presentPrice'],
        categoryId = json['categoryId'],
        categorySubId = json['categorySubId'],
        images = json['images'],
        description = json['description'];
}

class CategoryListModel {
  List<CategoryModel> data;
  CategoryListModel(this.data);
  factory CategoryListModel.fromJson(List json) {
    return CategoryListModel(
        json.map((item) => CategoryModel.fromJson(item)).toList());
  }
}