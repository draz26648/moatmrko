import 'package:dio/dio.dart';
import 'package:moatamrk/constant/end_points.dart';

import '../../helpers/shared_helper.dart';
import 'mapper.dart';

class NetworkHelper {
  static NetworkHelper? _instance;
  static late Dio _dio;

  NetworkHelper._internal();

  factory NetworkHelper() {
    if (_instance == null) {
      _dio = Dio();
      _dio.options.baseUrl = EndPoints.BASE_URL;

      _instance = NetworkHelper._internal();
    }
    return _instance!;
  }

  Future<dynamic> get(
      {required String url,
      Mapper? model,
      Map<String, dynamic>? query,
      var headers}) async {
    Response _res;
    if (headers != null) {
      _dio.options.headers = headers;
    } else {
      String? _token = await SharedHelper().readString(CachingKey.TOKEN);
      _dio.options.headers = {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/json'
      };
    }
    print('End point: => $url');
    try {
      _res = await _dio.get(url, queryParameters: query);
    } on DioError catch (e) {
      print('Exception in $url: => ${e.response.toString()}');
      _res = e.response!;
    }
    print('Response of $url: => ${_res.toString()}');
    if (model == null) {
      return _res;
    } else {
      return Mapper(model, _res.data);
    }
  }

  Future<dynamic> post({
    required String url,
    var body,
    Mapper? model,
    var headers,
    Map<String, dynamic>? query,
  }) async {
    Response _res;
    try {
      if (headers != null) {
        _dio.options.headers = headers;
      } else {
        String? _token = await SharedHelper().readString(CachingKey.TOKEN);
        _dio.options.headers = {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json'
        };
      }
      print('End point => $url');
      if (body != null) print(body.fields);
      _res = await _dio.post(url, data: body, queryParameters: query);
    } on DioError catch (e) {
      print('Exception in $url: => ${e.response.toString()}');
      _res = e.response!;
    }
    print('Response of $url: => ${_res.toString()}');
    if (model == null) {
      return _res;
    } else {
      return Mapper(model, _res.data);
    }
  }

  Future<List<dynamic>> getAllEvents({
    required String url,
  }) async {
    try {
      Response response = await _dio.get(url);
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getAllInstructors({
    required String url,
  }) async {
    try {
      Response response = await _dio.get(url);
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
