import 'package:get_it/get_it.dart';
import 'package:recipes_app/utils/network/network_manager.dart';

final getIt = GetIt.instance;

class ServiceLocator{

  static init(){
    initNetworkManager();
  }

  static initNetworkManager() {
    getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  }
}
