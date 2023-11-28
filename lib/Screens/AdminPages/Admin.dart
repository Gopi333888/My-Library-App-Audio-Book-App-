import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mylibrary/Functions/filepicker.dart';
import 'package:mylibrary/Functions/imagePicker.dart';
import 'package:mylibrary/Screens/AdminPages/datastoredpage.dart';
import 'package:mylibrary/Screens/Models/bookdata_model.dart';
import 'package:mylibrary/database/service/hivedatabase.dart';
import 'package:mylibrary/widgets/drop_down.dart';
import 'package:mylibrary/widgets/textfield.dart';
import 'package:audioplayers/audioplayers.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final formkey = GlobalKey<FormState>();
  AudioPlayer audioPlayer = AudioPlayer();
  String dropdownValue = 'Adventure';
  File? selectedImage;
  File? authorImage;
  final bookNameController = TextEditingController();
  final authorController = TextEditingController();
  final bookDetailsController = TextEditingController();
  final authorDetailsController = TextEditingController();
  String? audiofilePath;

  // Maintain a separate list for categories
  List<List<String>> categories = [
    ['Adventure'],
    ['Fantasy'],
    ['Science Fiction'],
    ['Travel'],
    ['Romance'],
    ['Novel'],
    ['Horror'],
    ['Humor'],
    ['Thriller'],
    ['War story'],
    ['Mystery'],
    ['Classics'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Upload Books"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const DataStoredScreen(),
            ));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormFieldWidget(
                  controller: bookNameController,
                  errorText: 'enter your book name',
                  keyboardType: TextInputType.name,
                  labeltext: "Book Name",
                  suffixText: "Books",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: DropDownButtonField(
                    hintText: 'Select category',
                    listName: categories,
                    item: false,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
                TextFormFieldWidget(
                  controller: authorController,
                  errorText: 'enter your book name',
                  keyboardType: TextInputType.name,
                  labeltext: "Author Name",
                  suffixText: "Author",
                ),
                TextFormFieldWidget(
                  controller: bookDetailsController,
                  errorText: 'enter your book name',
                  keyboardType: TextInputType.name,
                  labeltext: "Book Details",
                  suffixText: "Details",
                ),
                TextFormFieldWidget(
                  controller: authorDetailsController,
                  errorText: 'enter your book name',
                  keyboardType: TextInputType.name,
                  labeltext: "Author Details",
                  suffixText: "Details",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: selectedImage == null
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(selectedImage!)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: selectedImage == null
                            ? IconButton(
                                onPressed: () async {
                                  File? pickedImage =
                                      await selectImageFromGallery(context);
                                  setState(() {
                                    selectedImage = pickedImage;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          File? pickedImage =
                              await selectImageFromGallery(context);
                          setState(() {
                            authorImage = pickedImage;
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: authorImage != null
                                  ? FileImage(authorImage!)
                                  : null,
                              radius: 70,
                              backgroundColor: Colors.black,
                              child: authorImage == null
                                  ? const Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                      size: 25,
                                    )
                                  : const Icon(null),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 195),
                  child: OutlinedButton(
                    onPressed: () async {
                      audiofilePath = await pickAndPlayAudio(context);
                    },
                    style: const ButtonStyle(
                        side: MaterialStatePropertyAll(BorderSide(width: 1))),
                    child: const Text(
                      "Upload Audio",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (selectedImage != null) {
                        if (selectedImage != null &&
                            authorImage != null &&
                            audiofilePath != null) {
                          print("started");
                          final books = BookModel(
                            bookName: bookNameController.text,
                            author: authorController.text,
                            audioUrl: audiofilePath!,
                            imageUrl: selectedImage!.path.toString(),
                            bookDetails: bookDetailsController.text,
                            authorDetails: authorDetailsController.text,
                            authorimageUrl: authorImage!.path.toString(),
                            categories: dropdownValue,
                          );
                          await addBooks(books);
                          bookNameController.clear();
                          authorController.clear();
                          bookDetailsController.clear();
                          authorDetailsController.clear();
                          // Do not clear the categories list here
                          setState(() {
                            selectedImage = null;
                            authorImage = null;
                            audiofilePath = null;
                          });
                        }
                        print('finished');

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DataStoredScreen(),
                        ));
                      }
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    child: const Text(
                      "Upload Details",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
