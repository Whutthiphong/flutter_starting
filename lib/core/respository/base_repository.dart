import 'dart:convert';

import 'package:dio/dio.dart';

import '../network/exception/data_not_found_exception.dart';
import '../network/exception/not_found_exception.dart';
import '../network/exception/unauthoruzed_api_exception.dart';
import 'dart:developer' as logDev;

class BaseRepository {
  Response responseHandler(
    Response response,
  ) {
    // dio2curl(response.requestOptions);
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 204) {
      throw DataNotFoundException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 403) {
      throw UnAutherizedApiException();
    } else {
      throw Exception();
    }
  }

  Map<String, dynamic> toJson(String jsonString) {
    return jsonDecode(jsonString);
  }

  String toJsonString(Object data) {
    return jsonEncode(data);
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
}

class ResponseErrorCallBack {
  final Function(Response)? onDataNotFound;

  ResponseErrorCallBack({
    this.onDataNotFound,
  });
}
