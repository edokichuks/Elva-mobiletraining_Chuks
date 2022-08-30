import 'package:stacked/stacked.dart';

const String _NumberDelayFuture = 'delayedNumber';
const String _StringDelayFuture = 'delayedString';
const String _ChuksData2 = 'chuksData2';

class MultipleFuturesExampleViewModel extends MultipleFutureViewModel {
  ///A getter method to get the data from the server(Future data)
  int get fetchedNumber => dataMap![_NumberDelayFuture];
  String get fetchedString => dataMap![_StringDelayFuture];
  String get chuksData1 => dataMap!['chuksData'];
  String get chuksData2 => dataMap![_ChuksData2];

  ///This is used to set the future data to busy == true on loading and false when done loading

  bool get fetchingChuksData => busy('chuksData');
  bool get fetchingNumber => busy(_NumberDelayFuture);
  bool get fetchingString => busy(_StringDelayFuture);
  bool get fetchingChuksData2 => busy(_ChuksData2);

  @override

  /// Overriden mehtods....which accepts a Map of String, Future function
  Map<String, Future Function()> get futuresMap => {
        _NumberDelayFuture: getNumberAfterDelay,
        _StringDelayFuture: getStringAfterDelay,
        'chuksData': getChuksData,
        _ChuksData2: getChuksData2,
      };

  Future<String> getChuksData() async {
    await Future.delayed(const Duration(seconds: 5));

    return 'This is mine own implementatio';
  }

  Future<String> getChuksData2() async {
    await Future.delayed(const Duration(seconds: 7));
    String chuksCo = 'Gonna try this on home page';
    return chuksCo;
  }

  Future<int> getNumberAfterDelay() async {
    await Future.delayed(Duration(seconds: 10));
    return 3;
  }

  Future<String> getStringAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    return 'String data';
  }
}
