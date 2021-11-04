import 'package:json_annotation/json_annotation.dart';

part 'media-file.g.dart';

@JsonSerializable()
class MediaFile {
  int? id;
  String? file;

  MediaFile({this.id, this.file});
  factory MediaFile.fromJson(Map<String, dynamic> json) =>
      _$MediaFileFromJson(json);

  Map<String, dynamic> toJson() => _$MediaFileToJson(this);
}
