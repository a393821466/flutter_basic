import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import '../config/http_url.dart';

Future http_get(url, [query]) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    if (query == null) {
      response = await Dio().get(urlConfig[url]);
    } else {
      response = await Dio().get(urlConfig[url], queryParameters: query);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error===========>:' + e);
  }
}
