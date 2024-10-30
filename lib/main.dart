import 'package:flutter/material.dart';
import 'package:perpus/views/homeview.dart';

void main() {
  runApp(PerpustakaanApp());
}

class PerpustakaanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Perpustakaan Digital',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => Homeview(),
          // '/login': (context) => Homeview (),
        });
  }
}

// class HomePage extends StatelessWidget {
//   final List<Book> books = [
//     Book(
//       title: 'Jungle Book',
//       author: 'Hilal',
//       publisher: 'PT SMK TELKOM',
//       stock: 5,
//       assetPath: 'assets/tips2 - Copy.png',
//     ),
//     Book(
//       title: 'Black Hole',
//       author: 'Indra',
//       publisher: 'PT SMK TELKOM',
//       stock: 3,
//       assetPath: 'assets/tips1.png',
//     ),
//     // Tambahkan lebih banyak buku sesuai kebutuhan
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Perpustakaan Digital'),
//       ),
//       body: ListView.builder(
//         itemCount: books.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Navigasi ke halaman detail saat item diklik
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BookDetailPage(book: books[index]),
//                 ),
//               );
//             },
//             child: BookCard(book: books[index]),
//           );
//         },
//       ),
//     );
//   }
// }

// class Book {
//   final String title;
//   final String author;
//   final String publisher;
//   final int stock;
//   final String assetPath;

//   Book({
//     required this.title,
//     required this.author,
//     required this.publisher,
//     required this.stock,
//     required this.assetPath,
//   });
// }

// class BookCard extends StatelessWidget {
//   final Book book;

//   BookCard({required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(10),
//       child: Padding(
//         padding: EdgeInsets.all(10),
//         child: Row(
//           children: [
//             Image.asset(
//               book.assetPath,
//               width: 80,
//               height: 120,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(width: 15),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     book.title,
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 5),
//                   Text('Penulis: ${book.author}'),
//                   Text('Penerbit: ${book.publisher}'),
//                   Text('Stok: ${book.stock}'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Halaman detail buku
// class BookDetailPage extends StatelessWidget {
//   final Book book;

//   BookDetailPage({required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(book.title),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset(
//                 book.assetPath,
//                 width: 150,
//                 height: 220,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Judul: ${book.title}',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text('Penulis: ${book.author}', style: TextStyle(fontSize: 18)),
//             Text('Penerbit: ${book.publisher}', style: TextStyle(fontSize: 18)),
//             Text('Stok: ${book.stock}', style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
