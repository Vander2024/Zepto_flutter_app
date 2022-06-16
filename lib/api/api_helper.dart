import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:injectable/injectable.dart';

import '../app/app.locator.dart';
import '../sharedprefs/shared_pref_helper.dart';
import 'api_constants.dart';


@lazySingleton
class ApiHelper {

  final _sharedPrefs = zeptoLocator<SharedPrefsHelper>();

  Future<Dio> getApiClient(bool isAuth) async {
    String token = await _sharedPrefs.getToken();
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 600000,
      receiveTimeout: 600000,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.plain
    ));
    dio.options.headers['appversion'] = "1";
    dio.options.headers['appcode'] = "LMS";
    if(isAuth) {
      if (token.isNotEmpty) {
       // print('token-->' + token);
        dio.options.headers['Authorization'] = "Bearer $token";
      }
    }
    dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
    return dio;
  }
}
