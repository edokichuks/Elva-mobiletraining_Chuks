import 'dart:core';
import 'package:stacked/stacked.dart';
import '../../app/locator.dart';
import '../../models/product.dart';
import '../../services/api_services/api_servcies.dart';

class HomeScreenViewModel extends FutureViewModel {
  final String _title = 'Sneakers';

  final ApiServices apiServices = locator<ApiServices>();

  String get title => _title;

  String advertText = '-10% First APP purchase -> Voucher: APP10';
  String networkErrorText = 'Check your network connections';

  Product? _product;
  Product? get product => _product;

  Future singleProduct() async {
    // setBusy(true);
    final Product result = await apiServices.singleProduct();

    _product = result;
    var timeOut = await runBusyFuture(requestTimeOut());

    //  setBusy(false);
  }

  Future requestTimeOut() async {
    await Future.delayed(const Duration(seconds: 5));
    throw Exception(
        'Something went wrong!!! Please check your network connections');
  }

  @override
  Future futureToRun() {
    return singleProduct();
  }
}
