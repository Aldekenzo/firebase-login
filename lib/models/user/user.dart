import 'package:authtest/models/media-file/media-file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  @JsonKey(name: 'fullname')
  String? fullName;
  String? username;
  String? email;
  MediaFile? avatar;
  String? token;
  @JsonKey(name: 'is_new')
  bool? isNew;

  User({
    this.avatar,
    this.isNew,
    this.id,
    this.token,
    this.fullName,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
