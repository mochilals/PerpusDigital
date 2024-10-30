import 'package:flutter/material.dart';
import 'package:perpus/models/perpus.dart';

class BookDetailPage extends StatelessWidget {
  final BukuModel book;

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                book.posterPath,
                width: 150,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Judul: ${book.title}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Penulis: ${book.author}', style: TextStyle(fontSize: 18)),
            Text('Penerbit: ${book.publisher}', style: TextStyle(fontSize: 18)),
            Text('Stok: ${book.stock}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
