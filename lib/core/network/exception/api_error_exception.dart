import 'package:dio/src/dio_error.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as logDev;
import 'package:dio/dio.dart';

class ApiErrorException implements Exception {
  ApiErrorException(DioError err) {}

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
    logDev.log(curl, time: DateTime.now());
    print("----------------------");
  }
}
