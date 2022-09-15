import 'dart:developer';
import 'package:muroexe_store/src/core/constants/helper/setup_snackbar_ui.dart';
import 'package:muroexe_store/src/core/constants/helper/snackbar_services.dart';
import 'package:muroexe_store/src/models/signin.dart';
import 'package:muroexe_store/src/services/api_services/api_services.dart';
import 'package:muroexe_store/src/services/base/failure.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.dart';

class SignInViewModel extends BaseViewModel {
  String title = 'Log in to your account';
  String forgotPassword = 'Forgot your password?';
  String createAccount = 'No account? Create one here >';

  final signin = const Signin();
  final _snackbarServices = locator<SnackServices>();
  final _apiServices = locator<ApiServices>();
  final _mainSnackbarServices = locator<SnackbarService>();

  bool _isFilled = false;
  bool _isHidden = true;

  bool get isFilled => _isFilled;
  bool get isHidden => _isHidden;

  set isFilled(bool value) => value = _isFilled;

  void toggleFilled() {
    _isFilled = !_isFilled;
    notifyListeners();
  }

  void toggleHidden() {
    _isHidden = !_isHidden;
    notifyListeners();
  }

  Future signIn(Signin signin) async {
    //todo:use { username: "mor_2314", password: "83r5^_" } to get successful login
    try {
      setBusy(true);
      String? response = await _apiServices.signIn(signin);

      if (response == null) {
        _mainSnackbarServices.showCustomSnackBar(
            message: 'username or password is incorrect',
            title: 'Error',
            variant: SnackbarType.showErrorSnackBar);
      }
    } on Failure catch (ex) {
      log('Trying to login failed: $ex');
      _mainSnackbarServices.showCustomSnackBar(
        variant: SnackbarType.showErrorSnackBar,
        message: ex.message,
      );
      //_snackbarServices.showErrorSnackBar(ex.message);
    } finally {
      setBusy(false);
    }
  }
  //
  // @override
  // Future futureToRun() {
  //   // TODO: implement futureToRun
  //   return signIn(signin);
  // }
}
