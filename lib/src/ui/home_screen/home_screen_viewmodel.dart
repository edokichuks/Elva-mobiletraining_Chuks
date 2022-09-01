import 'dart:core';
import 'package:flutter/material.dart';
import 'package:muroexe_store/src/ui/sign_in_screen/sign_in_view.dart';
import 'package:stacked/stacked.dart';
import '../../app/locator.dart';
import '../../models/product.dart';
import '../../models/product_list/product_list.dart';
import '../../services/api_services/api_services.dart';

const String _singleProduct = 'singleProduct';
const String _limitedProduct = 'limitedProduct';

class HomeScreenViewModel extends MultipleFutureViewModel {
  final String _title = 'Sneakers';

  final ApiServices apiServices = locator<ApiServices>();

  String get title => _title;

  String advertText = '-10% First APP purchase -> Voucher: APP10';
  String networkErrorText = 'Check your network connections';

  ///type definition
  Product? _product;
  List<ProductList>? _limitedProductData;

  ///Map data made accessible
  List<ProductList>? get limitedProductData => dataMap![_limitedProduct];
  Product? get product => dataMap![_singleProduct];

  ///check for busy....isBusy?
  bool get limitedProductLoading => busy(_limitedProduct);
  bool get singleProductLoading => busy(_singleProduct);

  void navigateToSignIn(context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SignInView(),
        ),
      );

  Future<Product> singleProduct() async {
    final Product result = await apiServices.singleProduct();

    _product = result;
    return result;
    // var timeOut = await runBusyFuture(requestTimeOut());
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
  // TODO: implement futuresMap
  Map<String, Future Function()> get futuresMap => {
        _singleProduct: singleProduct,
        _limitedProduct: limitedProducts,
      };
}
