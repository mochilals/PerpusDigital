class BukuModel {
  int id;
  String posterPath;
  String author;
  String publisher;
  String title;
  int stock;
  BukuModel({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.stock,
    required this.posterPath,
  });
}
