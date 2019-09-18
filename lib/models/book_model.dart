class BookModel {
  final int id;
  final String title;
  final String autor;
  final String description;
  final String imgUrl;

  BookModel(this.id, this.title, this.autor, this.description, this.imgUrl);

  BookModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        autor = json['autor'],
        description = json['description'],
        imgUrl = json['imgUrl'];
}

class BookModelToJson {
  List<BookModel> data;
  BookModelToJson(this.data);
  factory BookModelToJson.fromJson(List json) {
    return BookModelToJson(
      json.map((item) => BookModel.fromJson(item)).toList(),
    );
  }
}
