import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/Screens/InnerScreens/audio_player_screen.dart';
import 'package:mylibrary/Screens/Models/bookdataModel.dart';

class AboutBookScreen extends StatefulWidget {
  const AboutBookScreen({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<AboutBookScreen> createState() => _AboutBookScreenState();
}

File? coverImage;
File? authorImage;

class _AboutBookScreenState extends State<AboutBookScreen> {
  @override
  void initState() {
    super.initState();
    coverImage = File(widget.bookModel.imageUrl);
    authorImage = File(widget.bookModel.authorimageUrl);
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Audio Books",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Stack(
                children: [
                  Container(
                    width: screenwidth - 30,
                    padding: const EdgeInsets.only(left: 15, top: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(coverImage!)),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: screenwidth * 0.46,
                                child: Text(
                                  widget.bookModel.bookName,
                                  style: GoogleFonts.poppins(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                              Text(widget.bookModel.author,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 18,
                    right: 5,
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.green,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioPlayerScreen(
                                  bookModel: widget.bookModel,
                                ),
                              ));
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 270),
                child: Text(
                  "About",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: screenheight * 0.01,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(59, 110, 107, 99),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 10, top: 10, bottom: 10),
                      child: Text(
                        widget.bookModel.bookDetails,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 270),
                child: Text(
                  "Author",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 29, top: 5),
                  child: SizedBox(
                    height: screenheight * 0.15,
                    width: screenwidth * 0.9,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: FileImage(authorImage!),
                          radius: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            widget.bookModel.author,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(59, 110, 107, 99),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 10, top: 10, bottom: 10),
                      child: Text(
                        widget.bookModel.authorDetails,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
