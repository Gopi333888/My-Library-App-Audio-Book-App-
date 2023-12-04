import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "About",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Text(""),
      ),
    );
  }
}
