import 'package:stacked/stacked.dart';

class SignInViewModel extends FutureViewModel {
  String title = 'Log in to your account';
  bool _isFilled = false;

  bool get isFilled => _isFilled;

  void toggleFilled() {
    _isFilled = !_isFilled;

    notifyListeners();
  }

  @override
  Future futureToRun() {
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
