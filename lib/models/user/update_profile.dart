import 'package:json_annotation/json_annotation.dart';

part 'update_profile.g.dart';

@JsonSerializable()
class UpdateProfile {
  String? fullname;
  String? email;
  int? avatar;
  UpdateProfile({
    this.fullname,
    this.email,
    this.avatar,
  });

  factory UpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileToJson(this);
}
