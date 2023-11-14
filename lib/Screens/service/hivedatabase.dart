import 'package:hive/hive.dart';
import 'package:mylibrary/Screens/Models/bookdataModel.dart';

Future<void> addBooks(BookModel value) async {
  final bookDB =
      await Hive.openBox<BookModel>('books_db'); // Use 'books_db' here
  await bookDB.add(value);
}

Future<List<BookModel>> getdata() async {
  final bookDB =
      await Hive.openBox<BookModel>('books_db'); // Use 'books_db' here
  return bookDB.values.toList();
}

Future<void> updateBookInHive(BookModel bookModel, int key) async {
  var box = await Hive.openBox<BookModel>('books_db');
  await box.put(key, bookModel); // Using the key to update the object in Hive
}

Future<bool> deleteBooksAFromHive(int index) async {
  final box = await Hive.openBox<BookModel>('books_db');
  try {
    await box.deleteAt(index);
    return true;
  } catch (e) {
    return false;
  }
}
