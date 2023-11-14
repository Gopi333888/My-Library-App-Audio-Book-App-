import 'package:flutter/material.dart';

class AudioBook extends StatelessWidget {
  const AudioBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Audio Book",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new_sharp)),
      ),
    );
  }
}
