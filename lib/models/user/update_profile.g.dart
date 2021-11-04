// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfile _$UpdateProfileFromJson(Map<String, dynamic> json) {
  return UpdateProfile(
    fullname: json['fullname'] as String?,
    email: json['email'] as String?,
    avatar: json['avatar'] as int?,
  );
}

Map<String, dynamic> _$UpdateProfileToJson(UpdateProfile instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'avatar': instance.avatar,
    };
