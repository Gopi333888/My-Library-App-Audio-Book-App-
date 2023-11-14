// ignore_for_file: file_names

import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> selectImageFromGallery(context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    // ignore: empty_catches
  } catch (e) {}
  return image;
}
