import 'package:flutter/material.dart';
import 'package:mylibrary/Screens/Models/bookdataModel.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    required this.bookModel,
    super.key,
  });
  final BookModel bookModel;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(widget.bookModel.bookName),
      )),
    );
  }
}
