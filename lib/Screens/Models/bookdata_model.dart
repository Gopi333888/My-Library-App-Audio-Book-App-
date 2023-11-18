import 'package:hive_flutter/adapters.dart';
part 'bookdata_model.g.dart';

@HiveType(typeId: 1)
class BookModel {
  @HiveField(0)
  final String bookName;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String audioUrl;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final String bookDetails;
  @HiveField(5)
  final String authorDetails;
  @HiveField(6)
  final String authorimageUrl;
  @HiveField(7)
  int? id;
  @HiveField(8)
  final String categories;
  BookModel(
      {required this.bookName,
      required this.author,
      required this.audioUrl,
      required this.imageUrl,
      required this.bookDetails,
      required this.authorDetails,
      required this.authorimageUrl,
      this.id,
      required this.categories});
}
