import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/InnerScreens/about_book.dart';
import 'package:mylibrary/Screens/Models/bookdata_model.dart';
import 'package:mylibrary/database/service/hivedatabase.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // ignore: non_constant_identifier_names
  final SearchController = TextEditingController();
  List<BookModel> bookDatas = [];

  Future<void> fetchBookData() async {
    List<BookModel> booksdata = await getdata();
    if (SearchController.text.isNotEmpty) {
      booksdata = booksdata
          .where((book) => book.bookName
              .toLowerCase()
              .contains(SearchController.text.toLowerCase()))
          .toList();
    }
    setState(() {
      bookDatas = booksdata;
    });
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
        centerTitle: true,
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: const TextStyle(color: Colors.white), //
              controller: SearchController,
              onChanged: (value) {
                fetchBookData();
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: radius15,
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    )),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2,
                )),
                labelText: "Search",
                labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          bookDatas.isEmpty
              ? const Text("Books Data is not Available")
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 13),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.5,
                              crossAxisCount: 3,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 10),
                      itemCount: bookDatas.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutBookScreen(
                                        bookModel: bookDatas[index],
                                      )),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.file(
                                  File(bookDatas[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

BorderRadius radius15 = BorderRadius.circular(15);
