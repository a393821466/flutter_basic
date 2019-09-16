import 'dart:io';
import 'package:dio/dio.dart';
import 'http_url.dart';
import 'dialog_utils.dart';

class HttpUtils {
  static HttpUtils instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = new CancelToken();
  static HttpUtils getInstance() {
    if (null == instance) instance = new HttpUtils();
    return instance;
  }

  // option配置
  HttpUtils() {
    options = BaseOptions(
        connectTimeout: 10000, //连接服务器超时时间，单位是毫秒.
        receiveTimeout: 5000, // 响应流上前后两次接受到数据的间隔，单位为毫秒。
        headers: {"version": '1.0.0'},
        // 请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
        contentType: ContentType.json,
        responseType: ResponseType.json);
    dio = new Dio(options);

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print('请求之前做的事情');
      return options;
    }, onResponse: (Response response) {
      print('响应之前做的事情');
      return response;
    }, onError: (DioError error) {
      print('错误之前');
      return error;
    }));
  }

  /**
   * get请求
   */
  Future get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(urlConfig[url],
          queryParameters: data, options: options, cancelToken: cancelToken);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('后端接口出现异常');
      }
    } catch (e) {
      print('post error---------$e');
      formartError(e);
    }
  }

  /*
   * post请求
   */
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(urlConfig[url],
          data: data, options: options, cancelToken: cancelToken);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('后端接口出现异常');
      }
    } on DioError catch (e) {
      print('post error---------$e');
      formartError(e);
    }
  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('后端接口出现异常');
      }
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formartError(e);
    }
  }

  /**
   * 错误统一处理
   */
  void formartError(DioError error) {
    if (error.type == DioErrorType.CONNECT_TIMEOUT) {
      print("连接超时");
      DialogUtils().showToastDialog("连接超时");
    } else if (error.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
      DialogUtils().showToastDialog("请求超时");
    } else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
      DialogUtils().showToastDialog("响应超时");
    } else if (error.type == DioErrorType.RESPONSE) {
      print("出现异常");
      DialogUtils().showToastDialog("出现异常");
    } else if (error.type == DioErrorType.CANCEL) {
      print("请求取消");
      DialogUtils().showToastDialog("请求取消");
    } else {
      print("未知错误");
      DialogUtils().showToastDialog("未知错误");
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
