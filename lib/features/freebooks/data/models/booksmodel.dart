class Booksmodel {
  String? title;
  String? descriptoin;
  String? image;
  Booksmodel(this.title, this.descriptoin, this.image);
  Booksmodel.fromjson(Map<String, dynamic> json) {
    title = json['volumeInfo']['title'];
    descriptoin = json['volumeInfo']['description'];
    image = json['volumeInfo']['imageLinks']['smallThumbnail'];
  }
}
