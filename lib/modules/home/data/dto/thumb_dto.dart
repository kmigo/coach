import 'package:coach/modules/home/domain/entities/thumb_entity.dart';

extension ThumbDTO on ThumbEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'image': image,
      'backgroundImg': backgroundImg,
      'year': year,
      'timeToRead': timeToRead,
      'color': color,
      'fontColor': fontColor,
    };
  }

  ThumbEntity copyWith({
    dynamic id,
    String? title,
    String? description,
    String? author,
    String? image,
    String? backgroundImg,
    String? year,
    String? timeToRead,
    String? color,
    String? fontColor,
  }) {
    return ThumbEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      image: image ?? this.image,
      backgroundImg: backgroundImg ?? this.backgroundImg,
      year: year ?? this.year,
      timeToRead: timeToRead ?? this.timeToRead,
      color: color ?? this.color,
      fontColor: fontColor ?? this.fontColor,
    );
  }

  static fromMap(Map<String, dynamic> map) {
    return ThumbEntity(
      id: map['id'] ?? -1,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      author: map['author'] ?? '',
      image: map['image'] ?? '',
      backgroundImg: map['backgroundImg'] ?? '',
      year: map['year'] ?? '',
      timeToRead: map['timeToRead'] ?? '',
      color: map['color'] ?? '#CD5C5C',
      fontColor: map['fontColor'] ?? '#FFA07A',
    );
  }
}
