import 'package:json_annotation/json_annotation.dart';

part 'user_credentials.g.dart';

@JsonSerializable()
class UserCredentials {
  final bool? isCodeCorrect;

  UserCredentials({
    this.isCodeCorrect
  });

  factory UserCredentials.fromJson(Map<String, dynamic> json) => _$UserCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialsToJson(this);
}