import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/InnerScreens/about_book.dart';
import 'package:mylibrary/database/service/hivedatabase.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: favoriteNotifier,
        builder: (context, bookDatas, _) {
          return bookDatas.isEmpty
              ? const Center(
                  child: Text(
                    "There is no favorite books Avilable",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.5,
                              crossAxisCount: 3,
                              mainAxisSpacing: 18,
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
                      }),
                );
        },
      ),
    );
  }
}
