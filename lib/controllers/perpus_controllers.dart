import 'package:perpus/models/perpus.dart';

class BookController {
  final List<BukuModel> books = [
    BukuModel(
      id: 1,
      title: 'Jungle Book',
      author: 'Hilal',
      publisher: 'PT SMK TELKOM',
      stock: 5,
      posterPath: 'assets/tips2 - Copy.png',
    ),
    BukuModel(
      id: 2,
      title: 'Black Hole',
      author: 'Indra',
      publisher: 'PT SMK TELKOM',
      stock: 3,
      posterPath: 'assets/tips1.png',
    ),
  ];
}
