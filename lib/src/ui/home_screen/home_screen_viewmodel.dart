import 'dart:core';
import 'package:stacked/stacked.dart';
import '../../app/locator.dart';
import '../../models/product.dart';
import '../../services/api_services/api_servcies.dart';

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
