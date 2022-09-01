import 'dart:core';
import 'package:stacked/stacked.dart';
import '../../app/locator.dart';
import '../../models/product.dart';
import '../../models/product_list/product_list.dart';
import '../../services/api_services/api_services.dart';

class HomeScreenViewModel extends FutureViewModel {
  final String _title = 'Sneakers';

  final ApiServices apiServices = locator<ApiServices>();

  String get title => _title;

  String advertText = '-10% First APP purchase -> Voucher: APP10';
  String networkErrorText = 'Check your network connections';

  Product? _product;
  List<ProductList>? _limitedProductData;

  List<ProductList>? get limitedProductData => _limitedProductData;

  Product? get product => _product;

  Future singleProduct() async {
    // setBusy(true);
    final Product result = await apiServices.singleProduct();

    _product = result;
    // var timeOut = await runBusyFuture(requestTimeOut());

    //  setBusy(false);
  }

  Future<List<ProductList>> limitedProducts() async {
    final List<ProductList> limited = await apiServices.limitedProduct();

    _limitedProductData = limited;
    return _limitedProductData as List<ProductList>;
  }

  Future requestTimeOut() async {
    await Future.delayed(const Duration(seconds: 5));
    throw Exception(
        'Something went wrong!!! Please check your network connections');
  }

  @override
  Future futureToRun() {
    //return singleProduct();
    return limitedProducts();
  }
}
