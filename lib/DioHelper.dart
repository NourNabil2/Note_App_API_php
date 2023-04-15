import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          // receiveTimeout: Duration(seconds: 5),
        ));
  }

  static Future<Response> getdata(
      {required String Url,
        Map<String ,dynamic >? query,
        }) async {

    return await dio.get(Url, queryParameters: query);
  }




  static Future<Response> postdata({
    required String path,
    required Map<String, dynamic> data,

  }) async {
    return dio.post(
      path,
      data: data,
    );
  }





  static Future<Response> putdata({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return dio.put(
      path,
      data: data,
    );
  }


}
