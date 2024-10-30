import 'package:flutter/material.dart';
import 'package:perpus/controllers/perpus_controllers.dart';
import 'package:perpus/models/perpus.dart';
import 'package:perpus/views/detailview.dart';
import 'package:perpus/widgets/menu_bottom.dart';
import 'package:perpus/widgets/modal.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final formKey = GlobalKey<FormState>();
  BookController books = BookController();
  TextEditingController title = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController publisher = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController posterPath = TextEditingController();
  List buttonChoice = ["Update", "Hapus"];
  List? book;
  int? book_id;
  getBook() {
    setState(() {
      book = books.books;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perpustakaan Digital'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  book_id = null;
                });
                title.text = '';
                posterPath.text = '';
                author.text = '';
                publisher.text = '';
                stock.text = '';
                ModalWidget().showFullModal(context, addItem(null));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: books.books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail saat item diklik
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BookDetailPage(book: books.books[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(
                      books.books[index].posterPath,
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            books.books[index].title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text('Penulis: ${books.books[index].author}'),
                          Text('Penerbit: ${books.books[index].publisher}'),
                          Text('Stok: ${books.books[index].stock}'),
                        ],
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return buttonChoice.map((r) {
                          return PopupMenuItem(
                            value: r,
                            child: Text(r),
                            onTap: () {
                              if (r == "Update") {
                                setState(() {
                                  book_id = books.books[index].id;
                                });

                                title.text = books.books[index].title;
                                posterPath.text = books.books[index].posterPath;
                                stock.text =
                                    books.books[index].stock.toString();
                                publisher.text = books.books[index].publisher;
                                author.text = books.books[index].author;
                                ModalWidget()
                                    .showFullModal(context, addItem(index));
                              } else if (r == "Hapus") {
                                books.books.removeWhere(
                                    (item) => item.id == books.books[index].id);
                                getBook();
                              }
                            },
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: MenuBottom(0),
    );
  }

  Widget addItem(int? index) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
                controller: title,
                decoration: InputDecoration(label: Text("Title")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: posterPath,
                decoration: InputDecoration(label: Text("Gambar")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: publisher,
                decoration: InputDecoration(label: Text("Publisher")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: author,
                decoration: InputDecoration(label: Text("author")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: stock,
                decoration: InputDecoration(label: Text("stock")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                }),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (index != null) {
                      book![index].id = book_id;
                      book![index].title = title.text;
                      book![index].posterPath = posterPath.text;
                      book![index].author = author.text;
                      book![index].publisher = publisher.text;
                      book![index].stock = int.parse(stock.text);
                      getBook();
                      Navigator.pop(context);
                    } else {
                      int _id_book = book!.length + 1;
                      book!.add(BukuModel(
                          id: _id_book,
                          title: title.text,
                          posterPath: posterPath.text,
                          author: author.text,
                          publisher: publisher.text,
                          stock: int.parse(stock.text)));
                      getBook();
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text("Simpan"))
          ],
        ),
      ),
    );
  }
}
