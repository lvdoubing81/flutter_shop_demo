/*
  推荐使用DIO来处理网络请求

  DIO文档：
  https://github.com/flutterchina/dio/blob/flutter/README-ZH.md

*/

import "dart:async";
import 'dart:io';

import "package:dio/dio.dart";



class HttpHelper {
  static final HttpHelper _instance = HttpHelper._internal();
  static Dio _dio;

  factory HttpHelper() {
    return _instance;
  }

  HttpHelper._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.15.105:8001',
      receiveTimeout: 40000,
      connectTimeout: 20000,
      responseType: ResponseType.json,
    );
    _dio = Dio(options);
    _dio.interceptors
        .add(InterceptorsWrapper(
          onRequest: (RequestOptions options) {
            print("options.path: ${options.baseUrl}${options.path}");
            print("options.data: ${options.data}");
            print("options.queryParameters: ${options.queryParameters}");
            options.data = options.data ?? {};
          },
          onResponse: (Response response) {
            return ApiResult.fromJson(response.data);
          },
    ));
  }

  void setToken(String token) {
    _dio.options.headers.addAll({"Authorization": "Basic $token"});
  }

  String getToken(){
    return _dio.options.headers["Authorization"];
  }

  /// 重新设置BaseUrl
  void setBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }

  /// Handy method to make http GET request, which is a alias of  [Dio.request].
  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onReceiveProgress,
      }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// Handy method to make http POST request, which is a alias of  [Dio.request].
  Future<Response<T>> post<T>(
      String path, {
        data,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
      }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }


  Future<Response> download(
      String urlPath,
      savePath, {
        ProgressCallback onReceiveProgress,
        Map<String, dynamic> queryParameters,
        CancelToken cancelToken,
        lengthHeader = HttpHeaders.contentLengthHeader,
        data,
        Options options,
      }) async {
    Dio dio = Dio();
    return dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        lengthHeader: lengthHeader,
        data: data,
        options: options,
    );
  }
}


class ApiResult {
  int code;
  String message;
  dynamic data;

  ApiResult({this.code, this.data, this.message});

  ApiResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}

class ApiErrorMessage {
  String message;
  String messageDetail;

  ApiErrorMessage({this.message, this.messageDetail});

  ApiErrorMessage.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    messageDetail = json['MessageDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['MessageDetail'] = this.messageDetail;
    return data;
  }
}


class HttpErrorParser{
  final DioError error;
  //DioError response;

  HttpErrorParser(this.error);

  String get message {

    print("=========================================");
    print("=== error type: ${error?.type}");
    if (error.response != null){
      print("=== error response: ${error.response?.toString()}");
      print("=== error response.data: ${error.response?.data}");
      print("=== error response.data: ${error.response.headers?.toString()}");
      print("=== error response.data: ${error.response.request?.toString()}");
      print("=== error response.status code: ${error.response?.statusCode}");
    } else {
      print("=== error.request: ${error.request.toString()}");
      print("=== error.message: ${error.message.toString()}");
    }


    var message = "";
    switch(error.type){
      case DioErrorType.CONNECT_TIMEOUT:
        message = "连接网络超时。";
        break;

      case DioErrorType.SEND_TIMEOUT:
        message = "发送数据超时。";
        break;

      case DioErrorType.RECEIVE_TIMEOUT:
        message = "接收数据超时。";
        break;

      case DioErrorType.RESPONSE:
        if (error.response != null) {
          var r = error.response.data;
          print("=== r.runtimeType = ${r.runtimeType}, r = $r");
          if (r is ApiResult){
            message = r.message;
          } else if (r is Map<String, dynamic>) {
            message = r["message"] ?? r["Message"];
          } else {
            message = r.toString();
          }
        } else {
          message = "网络错误，未返回数据。";
        }

        break;

      case DioErrorType.CANCEL:
        message = "网络请求已取消\n${error.message??""}";
        break;

      case DioErrorType.DEFAULT:
        if (error.response != null){
          message = "服务器错误(1)。";
        } else {
          if (error.message.contains("SocketException")) {
            message = "网络错误(1)。";
          } else if (error.message.contains("HttpException")) {
            message = "网络错误(2)。";
          } else {
            message = "网络错误(3)。";
          }
        }
        break;
    }


    return message;

  }
}

