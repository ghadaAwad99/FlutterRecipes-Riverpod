import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:recipes_app/utils/network/api_response.dart';
import 'package:recipes_app/utils/network/end_points.dart';
import 'package:recipes_app/utils/network/network_request.dart';

class NetworkManager {
  final Dio dio = Dio();

  NetworkManager() {
    initDio();
  }

  void initDio() {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        compact: false));
  }

  Future<ApiResponse> perform(NetworkRequest request) async {
    try {
      final Response<dynamic> response = await dio.request<dynamic>(
        request.url,
        data: request.data,
        queryParameters: request.queryParams,
        options: _getOptions(request),
      );
      return ApiResponse.success(response.data);
    } catch (e) {
      return ApiResponse.failed("ERROR REQUEST FAILED");
    }
  }

  Options _getOptions(NetworkRequest request) {
    return Options(
      headers: request.headers,
      method: request.method.name,
    );
  }
}