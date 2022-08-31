import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends FutureViewModel {
  String title = 'Log in to your account';
  String forgotPassword = 'Forgot your password?';
  String createAccount = 'No account? Create one here >';
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

  @override
  Future futureToRun() {
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
