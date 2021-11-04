// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPhone _$UserPhoneFromJson(Map<String, dynamic> json) {
  return UserPhone(
    phone: json['phone'] as String?,
    code: json['code'] as String?,
  );
}

Map<String, dynamic> _$UserPhoneToJson(UserPhone instance) => <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };
