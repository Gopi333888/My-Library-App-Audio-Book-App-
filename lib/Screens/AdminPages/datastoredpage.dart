import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/Screens/AdminPages/admin.dart';
import 'package:mylibrary/Screens/AdminPages/book_details.dart';
import 'package:mylibrary/Screens/Models/bookdata_model.dart';
import 'package:mylibrary/database/service/hivedatabase.dart';

class DataStoredScreen extends StatefulWidget {
  const DataStoredScreen({super.key});
  @override
  State<DataStoredScreen> createState() => _DataStoredScreenState();
}

List<BookModel> bookDatas = [];

class _DataStoredScreenState extends State<DataStoredScreen> {
  Future<void> fetchBookData() async {
    List<BookModel> booksdata = await getdata();
    setState(() {
      bookDatas = booksdata;
    });
  }

  @override
  void initState() {
    fetchBookData(); // ignore: unused_local_variable
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('rebuilding');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Book Collections",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          bookDatas.isEmpty
              ? const Text("Books Data is not Available")
              : Expanded(
                  child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.5,
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: bookDatas.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // showSelectedImageDialog(
                            //     context, bookDatas[index].imageUrl);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenBookDetails(
                                        bookModel: bookDatas[index])));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.file(
                                  File(
                                    (bookDatas[index].imageUrl),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 3,
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.green,
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.white,
                                              title: const Text("Delete Image"),
                                              content: const Text(
                                                  "Are you sure you want to delete ?"),
                                              actions: [
                                                ElevatedButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.green)),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child:
                                                        const Text("Cancel")),
                                                ElevatedButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.green)),
                                                    onPressed: () {
                                                      bookDatas.removeAt(index);
                                                      setState(() {
                                                        deleteBooksAFromHive(
                                                            index);
                                                      });

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text("Ok"))
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 20,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        );
                      }),
                )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AdminScreen(),
          ));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

void showSelectedImageDialog(BuildContext context, String imageFile) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Image.file(File(imageFile)),
        ),
      );
    },
  );
}
