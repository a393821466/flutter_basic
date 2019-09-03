class CategoryModel {
  final int id;
  final String goodsId;
  final String goodsName;
  final double oriPrice;
  final double presentPrice;
  final String categoryId;
  final int categorySubId;
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

// class CategoryModel {
//   bool success;
//   CategoryListData data;

//   CategoryModel({this.success, this.data});

//   CategoryModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null
//         ? new CategoryListData.fromJson(json['data'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class CategoryListData {
//   List<CategoryData> categoryData;
//   int pages;
//   int pageSizes;
//   int pageCount;
//   int allPage;

//   CategoryListData(
//       {this.categoryData,
//       this.pages,
//       this.pageSizes,
//       this.pageCount,
//       this.allPage});

//   CategoryListData.fromJson(Map<String, dynamic> json) {
//     if (json['categoryData'] != null) {
//       categoryData = new List<CategoryData>();
//       json['categoryData'].forEach((v) {
//         categoryData.add(new CategoryData.fromJson(v));
//       });
//     }
//     pages = json['pages'];
//     pageSizes = json['pageSizes'];
//     pageCount = json['pageCount'];
//     allPage = json['allPage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.categoryData != null) {
//       data['categoryData'] = this.categoryData.map((v) => v.toJson()).toList();
//     }
//     data['pages'] = this.pages;
//     data['pageSizes'] = this.pageSizes;
//     data['pageCount'] = this.pageCount;
//     data['allPage'] = this.allPage;
//     return data;
//   }
// }

// class CategoryData {
//   int id;
//   String goodsId;
//   String goodsName;
//   double oriPrice;
//   double presentPrice;
//   String categoryId;
//   int categorySubId;
//   String images;
//   String description;

//   CategoryData(
//       {this.id,
//       this.goodsId,
//       this.goodsName,
//       this.oriPrice,
//       this.presentPrice,
//       this.categoryId,
//       this.categorySubId,
//       this.images,
//       this.description});

//   CategoryData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     goodsId = json['goodsId'];
//     goodsName = json['goodsName'];
//     oriPrice = json['oriPrice'];
//     presentPrice = json['presentPrice'];
//     categoryId = json['categoryId'];
//     categorySubId = json['categorySubId'];
//     images = json['images'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['goodsId'] = this.goodsId;
//     data['goodsName'] = this.goodsName;
//     data['oriPrice'] = this.oriPrice;
//     data['presentPrice'] = this.presentPrice;
//     data['categoryId'] = this.categoryId;
//     data['categorySubId'] = this.categorySubId;
//     data['images'] = this.images;
//     data['description'] = this.description;
//     return data;
//   }
// }
