import 'package:dio/dio.dart';
import 'dart:io';
import '../config/http_url.dart';

Future http_get(String url, [query]) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');

    if (query == null) {
      response = await dio.get(httpUrl[url]);
    } else {
      response = await dio.get(httpUrl[url], queryParameters: query);
    }

    return response.data;
  } catch (e) {
    throw Exception('Error:${e}');
  }
}
