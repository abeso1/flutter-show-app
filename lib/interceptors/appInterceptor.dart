import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_show_app/constants/config.dart';
import 'package:flutter_show_app/main.dart';

class AppInterceptor extends Interceptor {
  //add something, remove or similar when requesting something in application
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.response?.statusCode) {
      //add other cases all according to backend team
      case 500:
        rootScaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
          content: Text(
            "Server error",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
        break;
      default:
        rootScaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
          content: Text(
            err.response?.data["ERROR"][0] ?? "",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
    }

    super.onError(err, handler);
  }
}

Dio http = (() {
  Dio dio = Dio(BaseOptions(baseUrl: Config.apiUrl));

  dio.interceptors.add(AppInterceptor());

  return dio;
})();
