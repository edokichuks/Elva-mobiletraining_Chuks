import 'dart:core';

import 'package:muroexe_store/app/locator.dart';
import 'package:muroexe_store/models/product.dart';
import 'package:muroexe_store/services/api_services/api_servcies.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  final String _title = 'Sneakers';

  final ApiServices apiServices = locator<ApiServices>();

  String get title => _title;

  Product? _product;
  Product? get product => _product;

  Future singleProduct() async {
    final Product result = await apiServices.singleProduct();

    _product = result;
  }
}
