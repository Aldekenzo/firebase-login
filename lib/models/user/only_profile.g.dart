// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'only_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePage _$ProfilePageFromJson(Map<String, dynamic> json) {
  return ProfilePage(
    fullName: json['fullname'] as String?,
    email: json['email'] as String?,
    avatar: json['avatar'] == null
        ? null
        : MediaFile.fromJson(json['avatar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfilePageToJson(ProfilePage instance) =>
    <String, dynamic>{
      'fullname': instance.fullName,
      'email': instance.email,
      'avatar': instance.avatar,
    };
