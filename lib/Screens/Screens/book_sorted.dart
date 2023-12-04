import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/InnerScreens/about_book.dart';
import 'package:mylibrary/Screens/Models/bookdata_model.dart';
import 'package:mylibrary/database/service/hivedatabase.dart';

class ScreenBookSorted extends StatefulWidget {
  const ScreenBookSorted({super.key, required this.category});
  final String category;

  @override
  State<ScreenBookSorted> createState() => _ScreenBookSortedState();
}

class _ScreenBookSortedState extends State<ScreenBookSorted> {
  List<BookModel> bookDatas = [];

  Future<List> fetchBookData() async {
    final bookData = await fetchBooksByCategory(category: widget.category);
    bookDatas = bookData;
    return bookDatas;
  }

  @override
  void initState() {
    fetchBookData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.category),
      ),
      body: FutureBuilder(
        future: fetchBooksByCategory(category: widget.category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            if (data!.isEmpty) {
              return const Center(
                child: Text(
                  "There is no book available in this category",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.5,
                    crossAxisCount: 3,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 10),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutBookScreen(
                                    bookModel: bookDatas[index],
                                  )));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        bookDatas[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
