import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/Screens/AdminPages/book_details.dart';
import 'package:mylibrary/Screens/Models/bookdata_model.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    required this.bookModel,
    Key? key,
  }) : super(key: key);

  final BookModel bookModel;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

const SizedBox divider = SizedBox(height: 20);

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final audioplayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String? bookAudio;

  @override
  void dispose() {
    audioplayer.pause(); // Pause the audio player when the screen is disposed
    audioplayer.release(); // Release resources associated with the audio player
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    coverImage = File(widget.bookModel.imageUrl);
    bookAudio = widget.bookModel.audioUrl;

    audioplayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    audioplayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });

    audioplayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioplayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioplayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.bookModel.imageUrl,
                    width: 300,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              divider,
              Column(
                children: [
                  Text(
                    widget.bookModel.bookName,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.bookModel.author,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Row(
                  children: [
                    IconButton(
                        color: Colors.white,
                        onPressed: () {
                          audioplayer
                              .seek(Duration(seconds: position.inSeconds - 5));
                        },
                        icon: const Icon(Icons.fast_rewind)),
                    const SizedBox(
                      width: 45,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 25,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () async {
                          if (isPlaying) {
                            await audioplayer.pause();
                          } else {
                            await audioplayer
                                .play(UrlSource(widget.bookModel.audioUrl));
                            // .play(DeviceFileSource(bookAudio!));
                          }
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    IconButton(
                        color: Colors.white,
                        onPressed: () {
                          audioplayer
                              .seek(Duration(seconds: position.inSeconds + 5));
                        },
                        icon: const Icon(Icons.fast_forward)),
                  ],
                ),
              ),
              SizedBox(
                width: 330,
                child: Column(
                  children: [
                    Slider(
                      thumbColor: Colors.white,
                      activeColor: const Color.fromARGB(255, 226, 223, 223),
                      inactiveColor: Colors.grey,
                      min: 0,
                      max: duration.inSeconds > 0
                          ? duration.inSeconds.toDouble()
                          : 0,
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        if (duration.inSeconds > 0) {
                          setState(() {
                            final newPosition =
                                Duration(seconds: value.toInt());
                            audioplayer.seek(newPosition);
                          });
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            formatTime(position),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            formatTime(duration - position),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatTime(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
