import 'package:dio/dio.dart';

class DioHelper{
  static Dio ? dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://accept.paymob.com/api/',
        receiveDataWhenStatusError: true
      )
    );
  }
  static Future<Response> getData({
  required String url,
    Map<String,dynamic>? query
})async{
 return await dio!.get(
   url,
   queryParameters: query
 );
  }
  static Future<Response> PostData({
  required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>?query
})async{
    return dio!.post(
      url,
      data: data,
      queryParameters: query
    );
  }
}