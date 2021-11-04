import 'package:authtest/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

interceptor(Dio dio) {
  Box tokenBox = Hive.box('token');
  int retries = 0;

  RequestOptions getOptions(RequestOptions options) {
    RequestOptions _options = options;
    _options.headers['USERNAME'] = 'admin';

    if (tokenBox.get('access') != null) {
      _options.headers['Authorization'] = 'Bearer ${tokenBox.get('access')}';
    }
    if (_options.headers['Content-Type'] != null) {
      _options.headers['Content-Type'] = 'application/json';
    }
    if (_options.headers['Accept'] != null) {
      _options.headers['Accept'] = 'application/json';
    }

    return _options;
  }

  return InterceptorsWrapper(
      onRequest: (options, handler) {
    return handler.next(getOptions(options));
  }, onResponse: (response, handler) {
    retries = 0;
    return handler.next(response);
  }, onError: (error, handler) async {
    // final AuthStore authStore = serviceLocator<AuthStore>();
    logger.i(error.response);

    if (error.response?.statusCode == 401 && retries == 0) {
      retries += 1;
      dio.interceptors.requestLock.lock();
      dio.interceptors.responseLock.lock();

      try {
        // await authStore.refreshToken();
        RequestOptions options = getOptions(error.response!.requestOptions);
        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();
        return dio
            .request(options.path, options: options.asOptions())
            .then((response) => handler.resolve(response));
      } on DioError {
        // authStore.logout();
        return;
      }
    } else if (error.response?.statusCode == 401) {
      retries = 0;
      // authStore.logout();
      return;
    } else {
      return handler.next(error);
    }
  });
}

extension _AsOptions on RequestOptions {
  Options asOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      extra: extra,
      headers: headers,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
  }
}
