
import 'package:dio/dio.dart';
import 'package:makan_employee/core/network/remote/end_points.dart';
import 'package:makan_employee/core/utils/constants.dart';



class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        followRedirects: false,
          validateStatus: (status) {
              return status! < 500;
            },
            
          baseUrl: ApiEndPoints.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            "Accept": "application/json",
            'Accept-Language':Constants.lang
          
          }),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      
      'Authorization': token ?? '',
       'Accept-Language':lang??Constants.lang

    };
    var res = await dio!.get(url, queryParameters: query);

    return res;
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
     
      'Authorization': token ?? '',
    };
    var res = await dio!.delete(url, queryParameters: query);

    return res;
  }

  static Future<Response> postData({
    required String url,
    dynamic data,
    String? lang,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
       'Accept-Language':Constants.lang,
      'Authorization': token ?? '',
    };
    try{
      var res = await dio!.post(
      url,
      data: data,
      queryParameters: query,
    );

    return res;
    }
    on DioError catch(e){
      rethrow;
    }
  }

    static Future<Response> putData({
    required String url,
    dynamic data,
    String? lang,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
       'Accept-Language':Constants.lang,
      'Authorization': token ?? '',
    };
    var res = await dio!.put(
      url,
      data: data,
      queryParameters: query,
    );

    return res;
  }
}



