import 'package:json_annotation/json_annotation.dart';

part 'user_phone.g.dart';

@JsonSerializable()
class UserPhone {
  final String? phone;
  final String? code;

  UserPhone( {
    this.phone,
    this.code,
  });

  factory UserPhone.fromJson(Map<String, dynamic> json) =>
      _$UserPhoneFromJson(json);

  Map<String, dynamic> toJson() => _$UserPhoneToJson(this);
}
