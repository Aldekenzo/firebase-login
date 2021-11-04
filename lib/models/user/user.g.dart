// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    avatar: json['avatar'] == null
        ? null
        : MediaFile.fromJson(json['avatar'] as Map<String, dynamic>),
    isNew: json['is_new'] as bool?,
    id: json['id'] as int?,
    token: json['token'] as String?,
    fullName: json['fullname'] as String?,
    username: json['username'] as String?,
    email: json['email'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullName,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'token': instance.token,
      'is_new': instance.isNew,
    };
