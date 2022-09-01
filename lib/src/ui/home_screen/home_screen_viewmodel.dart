import 'dart:core';
import 'package:stacked/stacked.dart';
import '../../app/locator.dart';
import '../../models/product.dart';
import '../../services/api_services/api_services.dart';

class HomeScreenViewModel extends FutureViewModel {
  final String _title = 'Sneakers';

  final ApiServices apiServices = locator<ApiServices>();

  String get title => _title;

  String advertText = '-10% First APP purchase -> Voucher: APP10';
  String networkErrorText = 'Check your network connections';

  Product? _product;
  List<Product>? _limitedProductData;

  List<Product>? get limitedProductData => _limitedProductData;

  Product? get product => _product;

  Future singleProduct() async {
    // setBusy(true);
    final Product result = await apiServices.singleProduct();

    _product = result;
    // var timeOut = await runBusyFuture(requestTimeOut());

    //  setBusy(false);
  }

  Future<List<Product>> limitedProducts() async {
    final List<Product> limited = await apiServices.limitedProduct();

    _limitedProductData = limited;
    return _limitedProductData as List<Product>;
  }

  Future requestTimeOut() async {
    await Future.delayed(const Duration(seconds: 5));
    throw Exception(
        'Something went wrong!!! Please check your network connections');
  }

  @override
  Future futureToRun() {
    return singleProduct();
    // return limitedProducts();
  }
}
