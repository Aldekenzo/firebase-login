import 'package:authtest/models/user/user_credentials.dart';
import 'package:authtest/models/user/user_phone.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'auth_client.g.dart';

@RestApi(baseUrl: 'http://37.18.30.235:8000/api/user')
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  @POST('/send_code/')
  Future<String?> authByPhone(@Body() UserPhone userPhone);

  @POST('/check_code/')
  Future<UserCredentials?> validate(@Body() UserPhone userPhone);

}