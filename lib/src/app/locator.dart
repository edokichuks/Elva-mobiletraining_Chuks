import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:muroexe_store/src/ui/home_screen/home_screen_view.dart';
import 'package:muroexe_store/src/ui/sign_in_screen/sign_in_view.dart';
import 'package:stacked/stacked_annotations.dart';
import '../core/constants/helper/error_snackbar.dart';
import '../services/api_services/api_services.dart';

final locator = GetIt.instance;

// setupAppLocation() {
//   //call in a service
//   locator.registerLazySingleton(() => ApiServices());
//   locator.registerLazySingleton(() => SnackBarWidget());
// }

@StackedApp(
    routes: [
  MaterialRoute(page: HomeScreenView, initial:  true),
      MaterialRoute(page: SignInView),
])

class AppSetup {
  /** Serves no purpose besides having annotation attached to it */
}
