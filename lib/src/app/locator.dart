import 'package:get_it/get_it.dart';
import '../services/api_services/api_servcies.dart';

final locator = GetIt.instance;

setupAppLocation() {
  //call in a service
  locator.registerLazySingleton(() => ApiServices());
}
