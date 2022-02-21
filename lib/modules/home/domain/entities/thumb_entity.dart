import 'package:equatable/equatable.dart';

class ThumbEntity extends Equatable {
  final dynamic id;
  final String title;
  final String description;
  final String author;
  final String image;
  final String backgroundImg;
  final String year;
  final String timeToRead;
  final String color;
  final String fontColor;
  const ThumbEntity(
      {required this.id,
      required this.title,
      required this.color,
      required this.fontColor,
      required this.description,
      required this.author,
      required this.year,
      required this.timeToRead,
      required this.image,
      required this.backgroundImg});

  @override
  List<Object?> get props => [id];
}
