import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'dart:developer' as logDev;

class ApiInterceptors implements InterceptorsWrapper {
  final Dio _dio;
  ApiInterceptors(this._dio);

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    _printErrorData(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // if (!(await _networkInfo.isConnected)) {
    //   throw InternetNotConnect();
    // }

    // String? accessToken =
    //     _sharedPreferencesUtil!.getString(SharedPreferencesUtil.keyAccessToken);

    //set baseUrl ตรงนนี้ !!!
    options.baseUrl = "https://dummyjson.com/";

    // if (!options.path.contains("oauth2/login"))
    // options.headers['Authorization'] = 'Bearer $accessToken';

    if (kDebugMode) {
      _printRequestData(options);
      dio2curl(options);
    }

    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      _printResponseData(response);
      // dio2curl(response.requestOptions);
    }

    handler.next(response);
  }

  dio2curl(RequestOptions requestOption) {
    var curl = '';

    // Add PATH + REQUEST_METHOD
    curl +=
        'curl --request ${requestOption.method} \'${requestOption.baseUrl}${requestOption.path}\'';

    // Include headers
    for (var key in requestOption.headers.keys) {
      curl += ' -H \'$key: ${requestOption.headers[key]}\'';
    }

    // Include data if there is data
    if (requestOption.data != null) {
      curl += ' --data-binary \'${requestOption.data}\'';
    }

    curl += ' --insecure'; //bypass https verification
    print("-------- cURL --------");
    logDev.log(curl);
    print("----------------------");
  }

  _printRequestData(RequestOptions options) {
    print(
        "Request : ${options.method.toUpperCase()} --> ${options.baseUrl}${options.path}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters.isNotEmpty) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }

    print("--> END");
  }

  _printResponseData(Response response) {
    print(
        "<-- ${response.statusCode} : ${(response.requestOptions.baseUrl) + (response.requestOptions.path)}");
    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END");
  }

  _printErrorData(DioError err) {
    print(
        "<--${err.response?.statusCode ?? '' + " : "}  ${err.message} ${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
    print("${err.response != null ? err.response!.data : 'Unknown Error'}");
    print("<-- End error");
  }
}
