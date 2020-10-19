import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';

class DioUtiles {
  // static Dio dio;
  static const String API_PREFIX = 'http://119.135.191.38:6001/api';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// request method
  //url 请求链接
  //parameters 请求参数
  //metthod 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static Future<Map> request<T>(String url,
      {parameters,
      method,
      Function(T t) onSuccess,
      Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    /// 打印:请求地址-请求方式-请求参数
    // print('请求地址：【' + method + '  ' + url + '】');
    // print('请求参数：' + parameters.toString());

    // Dio dio = createInstance();
    var dio = Dio(BaseOptions(
      baseUrl: API_PREFIX,
      connectTimeout: 15000,
      receiveTimeout: 15000,
    ));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options){
      
      // print(options.headers);
      options.headers["Authorization"] = "Bearer "+"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZnhqIiwidXNlcl9pZCI6IjYiLCJleHAiOjE1OTk4MzE2NjIsImlzcyI6InN5Y2Zncm91cC5jb20iLCJhdWQiOiJVc2VyIn0.wRwogaz7mn7m9WGtVezztTfV1lqvi_PMR6WY9ZdQtlo";
      // print(options.headers);
      print('请求之前');
      return options; //continue
      
    }));

    //请求结果
    var result;
    try {
      Response response = await dio.request(API_PREFIX + url,
          data: parameters, options: new Options(method: method));
      result = json.decode(response.toString());
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(result);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
      print('响应数据：' + response.toString());
      return result;
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
    return result;
  }

  /// 创建 dio 实例对象
  // static Dio createInstance() {
  //   if (dio == null) {
  //     /// 全局属性：请求前缀、连接超时时间、响应超时时间
  //     var options = BaseOptions(
  //       connectTimeout: 15000,
  //       receiveTimeout: 15000,
  //       responseType: ResponseType.plain,
  //       validateStatus: (status) {
  //         // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
  //         return true;
  //       },
  //       baseUrl: API_PREFIX,
  //     );

  //     dio = new Dio(options);
  //   }

  //   return dio;
  // }

  /// 清空 dio 对象
  // static clear() {
  //   dio = null;
  // }
}
