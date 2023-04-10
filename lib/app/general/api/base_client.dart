import 'package:dio/dio.dart';

class BaseClient {
  static Future<BaseOptions> getBasseOptions() async {
    
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer token',
      },
    );

    return options;
  }

  static Future<dynamic> get({required String url, var payload}) async {
    var dio = Dio(await getBasseOptions());

    var response = await dio.get(url, queryParameters: payload);
    return response;
  }

  static Future<dynamic> post({url, payload}) async {
    var dio = Dio(await getBasseOptions());
    var response = await dio.post(url, data: payload);
    return response;
  }

  static Future<dynamic> postWithQP({url, queryPayload}) async {
    var dio = Dio(await getBasseOptions());
    var response = await dio.post(url, queryParameters: queryPayload);
    return response;
  }

  static Future<dynamic> put({url, payload}) async {
    var dio = Dio(await getBasseOptions());
    var response = await dio.put(url, data: payload);
    return response;
  }

  static Future<dynamic> delete({url}) async {
    var dio = Dio(await getBasseOptions());
    var response = await dio.delete(url);
    return response;
  }
}
