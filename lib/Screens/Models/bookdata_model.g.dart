// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookdata_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 1;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      bookName: fields[0] as String,
      author: fields[1] as String,
      audioUrl: fields[2] as String,
      imageUrl: fields[3] as String,
      bookDetails: fields[4] as String,
      authorDetails: fields[5] as String,
      authorimageUrl: fields[6] as String,
      id: fields[7] as int?,
      categories: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.bookName)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.audioUrl)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.bookDetails)
      ..writeByte(5)
      ..write(obj.authorDetails)
      ..writeByte(6)
      ..write(obj.authorimageUrl)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
