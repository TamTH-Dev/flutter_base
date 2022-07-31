import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    this.albumId = 0,
    this.id = 0,
    this.title = '',
    this.url = '',
    this.thumbnailUrl = '',
  });

  factory Photo.fromJson(Object? json) =>
      _$PhotoFromJson(json as Map<String, dynamic>);

  static List<Photo> fromList<T>(List json) {
    return json.map((e) => Photo.fromJson(e as Map<String, dynamic>)).toList();
  }
}
