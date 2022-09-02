import 'package:flutter/cupertino.dart';
import 'package:muroexe_store/src/models/signin.dart';
import 'package:muroexe_store/src/services/api_services/api_services.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends FutureViewModel {
  String title = 'Log in to your account';
  String forgotPassword = 'Forgot your password?';
  String createAccount = 'No account? Create one here >';
  Signin signin = Signin();
  BuildContext get context => context;

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

  Future signIn(context, Signin signin) async {
    var response = ApiServices().signIn(context, signin);
    return response;
  }

  @override
  Future futureToRun() {
    // TODO: implement futureToRun
    return signIn(
      context,
      signin,
    );
  }
}
