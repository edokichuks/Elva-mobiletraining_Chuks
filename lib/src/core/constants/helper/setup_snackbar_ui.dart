import 'package:flutter/material.dart';
import 'package:muroexe_store/src/core/constants/app_color.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dart';

enum SnackbarType {
  showErrorSnackBar,
  showSuccessSnackBar
}


void setupSnackbarUi() {
  final _snackbarService = locator<SnackbarService>();

  _snackbarService.registerCustomSnackbarConfig(
      variant: SnackbarType.showErrorSnackBar,
    config:    SnackbarConfig(
      backgroundColor:  Muroexe.warmingRedColor,
      textColor: Muroexe.mainColor,

    ),

   );

  _snackbarService.registerCustomSnackbarConfig(variant: SnackbarType.showSuccessSnackBar,
  config: SnackbarConfig(
    backgroundColor: Muroexe.mainColor.withOpacity(0.8),

  ),
  );

}
