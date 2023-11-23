import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mylibrary/Screens/Models/bookdata_model.dart';

ValueNotifier<List<BookModel>> favoriteNotifier = ValueNotifier(<BookModel>[]);

String? currentuser;

Future<void> addBooks(BookModel value) async {
  value.favoriteUserIds = [];
  final bookDB =
      await Hive.openBox<BookModel>('books_db'); // Use 'books_db' here
  await bookDB.add(value);
}

Future<List<BookModel>> getdata() async {
  final bookDB =
      await Hive.openBox<BookModel>('books_db'); // Use 'books_db' here
  return bookDB.values.toList();
}

Future<void> updateBookInHive(BookModel bookModel, BookModel book) async {
  int key = getKeyOfBookModel(book);
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

Future<List<BookModel>> fetchBooksByCategory({required String category}) async {
  final box = await Hive.openBox<BookModel>('books_db');
  return box.values
      .toList()
      .where((book) => book.categories.toLowerCase() == category.toLowerCase())
      .toList();
}

Future<void> getFavorite() async {
  final box = await Hive.openBox<BookModel>('books_db');
  final favoriteList = box.values
      .toList()
      .where((books) => books.favoriteUserIds!.contains(currentuser));
  favoriteNotifier.value = favoriteList.toList();
  favoriteNotifier.notifyListeners();
}

Future<void> addAndremoveFavorite(BookModel bookModels) async {
  BookModel book = bookModels;
  if (bookModels.favoriteUserIds!.contains(currentuser)) {
    bookModels.favoriteUserIds!.remove(currentuser);
  } else {
    bookModels.favoriteUserIds!.add(currentuser!);
  }
  await updateBookInHive(bookModels, book);
  await getFavorite();
}

int getKeyOfBookModel(BookModel book) {
  var box = Hive.box<BookModel>('books_db');
  var key = box.keyAt(box.values.toList().indexOf(book));
  return key;
}
