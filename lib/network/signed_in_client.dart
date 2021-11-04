import 'package:authtest/models/user/only_profile.dart';
import 'package:authtest/models/user/update_profile.dart';
import 'package:authtest/models/user/user.dart';
import 'package:authtest/models/user/user_phone.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'signed_in_client.g.dart';

@RestApi(baseUrl: 'http://37.18.30.235:8000/api/user')
abstract class SignedInClient {
  factory SignedInClient(Dio dio, {String? baseUrl}) = _SignedInClient;

  @POST('/login_or_register/')
  Future<User?> getUser(@Body() UserPhone userPhone);

  @PUT('/update_user/')
  Future<ProfilePage?> updateUser(@Body() UpdateProfile updateProfile);

  @GET('/me/')
  Future<User?> getUserProfile();
}
