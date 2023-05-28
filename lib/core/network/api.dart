import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'error/bad_network_api_error.dart';
import 'error/unauthorized_api_error.dart';
import 'exception/api_error_exception.dart';
import 'exception/bad_network_api_exception.dart';
import 'exception/unauthoruzed_api_exception.dart';
import 'intercepters/api_interceptors.dart';

@injectable
class ApiProvider {
  final Dio _dio = new Dio();

  ApiProvider() {
    _dio.interceptors.clear();
    _dio.interceptors.add(ApiInterceptors(_dio));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response res = await _dio.get(path, queryParameters: queryParameters);

      return res;
    } on BadNetworkApiError {
      throw BadNetworkApiException();
    } on UnAuthorizedApiError {
      throw UnAutherizedApiException();
    } on DioError catch (err) {
      throw ApiErrorException(err);
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? body}) async {
    try {
      Response res = await _dio.post(path, data: jsonEncode(body));

      return res;
    } on BadNetworkApiError {
      throw BadNetworkApiException();
    } on UnAuthorizedApiError {
      throw UnAutherizedApiException();
    } on DioError catch (e) {
      throw ApiErrorException(e);
    }
  }

  Future<Response> getUri(Uri uri) async {
    try {
      Response res = await _dio.getUri(uri);

      return res;
    } on BadNetworkApiError {
      throw BadNetworkApiException();
    } on UnAuthorizedApiError {
      throw UnAutherizedApiException();
    } on DioError catch (err) {
      throw ApiErrorException(err);
    }
  }

  Future<Response> getRefreshToken(String refreshToken) async {
    try {
      // FormData data = FormData();

      // data.fields.add(MapEntry("refresh_token", refreshToken));

      return await _dio.post("/dodee/v1/authen/oauth2/refresh-token",
          data: {"refresh_token": refreshToken});
    } on BadNetworkApiError {
      throw BadNetworkApiException();
    } on UnAuthorizedApiError {
      throw UnAutherizedApiException();
    } on DioError catch (e) {
      throw ApiErrorException(e);
    }
  }

  cancelRequest() {
    _dio.close(force: true);
  }
}
