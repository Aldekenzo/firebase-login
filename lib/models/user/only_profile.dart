import 'package:authtest/models/media-file/media-file.dart';
import 'package:json_annotation/json_annotation.dart';
part 'only_profile.g.dart';

@JsonSerializable()
class ProfilePage {
  @JsonKey(name: 'fullname')
  String? fullName;
  String? email;
  MediaFile? avatar;
  ProfilePage({
    this.fullName,
    this.email,
    this.avatar,
  });

  factory ProfilePage.fromJson(Map<String, dynamic> json) =>
      _$ProfilePageFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePageToJson(this);
}
