import 'package:authtest/network/auth_client.dart';
import 'package:authtest/network/interceptors/interceptor.dart';
import 'package:authtest/network/interceptors/log_interceptor.dart';
import 'package:authtest/network/signed_in_client.dart';
import 'package:authtest/notifier_service.dart';
import 'package:authtest/stores/auth_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void serviceLocatorSetup() {
  serviceLocator
    ..registerFactory<AuthClient>(() {
      final dio = Dio();
      dio.interceptors
        ..add(interceptor(dio))
        ..add(LoggerInterceptor(
            requestBody: true, responseBody: true, requestHeader: true));

      return AuthClient(dio,
          baseUrl: 'http://37.18.30.235:8000/api/user');
    })
    ..registerFactory<SignedInClient>(() {
      final dio = Dio();
      dio.interceptors
        ..add(interceptor(dio))
        ..add(LoggerInterceptor(
            requestBody: true, responseBody: true, requestHeader: true));

      return SignedInClient(dio,
          baseUrl: 'http://37.18.30.235:8000/api/user');
    })
    ..registerSingleton<AuthStore>(AuthStore())
    ..registerSingleton<NotifierService>(NotifierService());
}
