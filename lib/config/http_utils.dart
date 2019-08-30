import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';

Map httpUrl = {
  'getHomeBanner':'https://easy-mock.com/mock/5d6109a5825d2b57ed75bbd6/example_copy/homebanner',
  'classifyApi':
      'https://easy-mock.com/mock/5d6109a5825d2b57ed75bbd6/example_copy/categoryList'
};

Future http_get(url, [query]) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    if (query == null) {
      response = await Dio().get(httpUrl[url]);
    } else {
      response = await Dio().get(httpUrl[url], queryParameters: query);
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
