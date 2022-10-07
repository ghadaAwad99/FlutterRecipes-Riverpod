
import 'package:recipes_app/di/service_locator.dart';
import 'package:recipes_app/utils/network/end_points.dart';
import 'package:recipes_app/utils/network/network_manager.dart';

class BaseService {

  final NetworkManager networkManager = getIt.get<NetworkManager>();

  Future<Map<String, String>> getHeaders() async {
    return {
      "Content-Type": "application/json",
      "x-api-key" : EndPoints.apiKey,
    };
  }

}