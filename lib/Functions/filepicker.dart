import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mylibrary/Screens/AdminPages/book_details.dart';

AudioPlayer audioPlayer = AudioPlayer();
Future<String?> pickAndPlayAudio(context) async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.audio);

  if (result != null) {
    audiofilePath = result.files.single.path!;
    return audiofilePath;
  }
  return '';
}
