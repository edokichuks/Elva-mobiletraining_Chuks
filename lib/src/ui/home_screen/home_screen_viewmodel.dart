import 'dart:core';
import 'package:flutter/material.dart';
import 'package:muroexe_store/src/app/app.router.dart';
import 'package:muroexe_store/src/services/base/failutre.dart';
import 'package:muroexe_store/src/ui/sign_in_screen/sign_in_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.dart';
import '../../core/constants/helper/snackbar_services.dart';
import '../../models/product.dart';
import '../../models/product_list/product_list.dart';
import '../../services/api_services/api_services.dart';

const String _singleProduct = 'singleProduct';
const String _limitedProduct = 'limitedProduct';

class HomeScreenViewModel extends MultipleFutureViewModel {
  final String _title = 'Sneakers';

  final ApiServices _apiServices = locator<ApiServices>();
  final _navigationServices = locator<NavigationService>();
  final _snackbarServices = locator<SnackServices>();

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

  void navigateToSignIn() => _navigationServices.navigateTo(Routes.signInView);

  Future<Product?> singleProduct() async {
    setBusy(true);
    try {
      final Product? result = await _apiServices.singleProduct();

      _product = result;
      return result!;
      // var timeOut = await runBusyFuture(requestTimeOut());
    } on Failure catch (ex, stackTrace) {
      print('''
      This is the exception
      ${ex.toString()},
      located at: $stackTrace
      ''');

      _snackbarServices.showErrorSnackBar(ex.toString());
    } finally {
      setBusy(false);
    }

    ///to remove this line
    return _product;
  }

  Future<List<ProductList>> limitedProducts() async {
    setBusy(true);

    try {
      final List<ProductList>? limited = await _apiServices.limitedProduct();

      _limitedProductData = limited;

      return _limitedProductData as List<ProductList>;
    } on Failure catch (ex) {
      print('''
      This is the exception
      ${ex.message}
      ''');
      _snackbarServices.showErrorSnackBar(ex.message);
    } finally {
      setBusy(false);
    }

    ///remove this line of code
    return _limitedProductData as List<ProductList>;
  }

  Future requestTimeOut() async {
    await Future.delayed(const Duration(seconds: 5));
    throw Exception(
        'Something went wrong!!! Please check your network connections');
  }

  @override
  Map<String, Future Function()> get futuresMap => {
        _singleProduct: singleProduct,
        _limitedProduct: limitedProducts,
      };
}
