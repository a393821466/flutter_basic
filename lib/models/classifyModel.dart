class ClassifyModel {
  final String mallCategoryId;
  final String mallCategoryName;
  final List<dynamic> bxMallSubDto;
  final String comments;
  final String image;

  ClassifyModel(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image});

  ClassifyModel.fromJson(Map<String, dynamic> json)
      : mallCategoryId = json['mallCategoryId'],
        mallCategoryName = json['mallCategoryName'],
        bxMallSubDto = json['bxMallSubDto'],
        comments = json['comments'],
        image = json['image'];
}

class ClassifyListModel {
  List<ClassifyModel> data;
  ClassifyListModel(this.data);
  factory ClassifyListModel.formJson(List json) {
    return ClassifyListModel(
        json.map((item) => ClassifyModel.fromJson(item)).toList());
  }
}

class BxMallSubDtoModel {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDtoModel(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  BxMallSubDtoModel.fromJson(Map<String, dynamic> json)
      : mallSubId = json['mallSubId'],
        mallCategoryId = json['mallCategoryId'],
        mallSubName = json['mallSubName'],
        comments = json['comments'];
  Map<String, dynamic> toJson() => {
        'mallSubId': mallSubId,
        'mallCategoryId': mallCategoryId,
        'mallSubName': mallSubName,
        'comments': comments,
      };
}

// class BxMallSubListModel {
//   List<BxMallSubDtoModel> data;
//   BxMallSubListModel(this.data);

//   factory BxMallSubListModel.fromJson(List json) {
//     return BxMallSubListModel(
//         json.map((item) => BxMallSubDtoModel.fromJson(item)).toList());
//   }
// }
