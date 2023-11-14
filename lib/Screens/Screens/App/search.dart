import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Search"),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new_sharp)),
      ),
    );
  }
}
