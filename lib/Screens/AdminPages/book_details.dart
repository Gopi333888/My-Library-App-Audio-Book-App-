import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mylibrary/Functions/filepicker.dart';
import 'package:mylibrary/Functions/imagePicker.dart';
import 'package:mylibrary/Screens/AdminPages/datastoredpage.dart';
import 'package:mylibrary/Screens/Models/bookdata_model.dart';
import 'package:mylibrary/Screens/Models/category.dart';
import 'package:mylibrary/Screens/service/hivedatabase.dart';
import 'package:mylibrary/widgets/books_textfeild.dart';
import 'package:mylibrary/widgets/drop_down.dart';

class ScreenBookDetails extends StatefulWidget {
  const ScreenBookDetails({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<ScreenBookDetails> createState() => _ScreenBookDetailsState();
}

final audioplayer = AudioPlayer();
bool isPlaying = false;
File? coverImage;
File? selectImage;
late TextEditingController bookNameController;
late TextEditingController authorController;
late TextEditingController bookDetailsController;
late TextEditingController authorDetailsController;
String dropdownValue = 'dd';
String? audiofilePath;
String? bookAudioForUpdate;

class _ScreenBookDetailsState extends State<ScreenBookDetails> {
  final dividers = const SizedBox(
    height: 20,
  );

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    bookNameController = TextEditingController(text: widget.bookModel.bookName);
    authorController = TextEditingController(text: widget.bookModel.author);
    bookDetailsController =
        TextEditingController(text: widget.bookModel.bookDetails);
    authorDetailsController =
        TextEditingController(text: widget.bookModel.authorDetails);
    dropdownValue = widget.bookModel.categories;
    coverImage = File(widget.bookModel.imageUrl);
    selectImage = File(widget.bookModel.authorimageUrl);
    bookAudioForUpdate = widget.bookModel.audioUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(widget.bookModel.bookName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dividers,
            Center(
              child: InkWell(
                onTap: () async {
                  File? pickedImage = await selectImageFromGallery(context);
                  setState(() {
                    coverImage = pickedImage;
                  });
                },
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: FileImage(coverImage!)),
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            dividers,
            BooksTextfield(
              controller: bookNameController,
              labeltext: "Book Name",
            ),
            dividers,
            BooksTextfield(
              controller: authorController,
              labeltext: "Author Name",
            ),
            dividers,
            BooksTextfield(
              controller: bookDetailsController,
              labeltext: "Book Details",
            ),
            dividers,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DropDownButtonField(
                  categorySelectedValue: dropdownValue,
                  hintText: 'Select category',
                  listName: categories,
                  item: true,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  }),
            ),
            dividers,
            BooksTextfield(
              controller: authorDetailsController,
              labeltext: "Author Details",
            ),
            dividers,
            dividers,
            InkWell(
              onTap: () async {
                File? pickedImage = await selectImageFromGallery(context);
                setState(() {
                  selectImage = pickedImage;
                });
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: FileImage(selectImage!),
                          radius: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      if (isPlaying) {
                                        await audioPlayer.pause();
                                      } else {
                                        await audioPlayer.play(DeviceFileSource(
                                            bookAudioForUpdate!));
                                      }
                                    },
                                    icon: Icon(
                                      isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                    )),
                              ),
                              ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black)),
                                  onPressed: () async {
                                    bookAudioForUpdate =
                                        await pickAndPlayAudio(context);
                                  },
                                  child: const Text("Edit Audio")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            dividers,
            Center(
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Colors.black,
                  )),
                  onPressed: () async {
                    await updatedbook();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DataStoredScreen(),
                        ));
                  },
                  child: const Text("Update Details")),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updatedbook() async {
    final updatedbook = BookModel(
        bookName: bookNameController.text,
        author: authorController.text,
        audioUrl: bookAudioForUpdate!,
        imageUrl: coverImage!.path,
        bookDetails: bookDetailsController.text,
        authorDetails: authorDetailsController.text,
        authorimageUrl: selectImage!.path,
        categories: dropdownValue);
    int key = getKeyOfBookModel(widget.bookModel);
    await updateBookInHive(updatedbook, key);
  }

  int getKeyOfBookModel(BookModel book) {
    var box = Hive.box<BookModel>('books_db');
    var key = box.keyAt(box.values.toList().indexOf(book));
    return key;
  }
}
