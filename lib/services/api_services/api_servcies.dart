import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:muroexe_store/models/product.dart';

@lazySingleton
class ApiServices {
  //
  static const String apiBase = 'https://fakestoreapi.com/';

  postMethod({data, apiUrl}) async {
    var fullUrl = apiBase + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
  }

  static getMethod({getLink}) async {
    var fullUrl = apiBase + getLink;

    return await http.get(Uri.parse(fullUrl));
  }

  Future<Product> singleProduct() async {
    //https: //fakestoreapi.com/products?limit=5

    var res = await getMethod(getLink: 'products/4');
    if (res.statusCode == 200) {
      //print('success');
      return Product.fromJson(json.decode(res.body));
    } else {
      return throw 'Error From Network';
    }
  }

  // List<int> loop = [0, 1, 2, 3];

  Future<List<Product>> limitedProduct() async {
    var res = await getMethod(getLink: 'products?limit=5');

    if (res.statusCode == 200) {
      List<Product> data = List<Product>.from(
          json.decode(res.body).map((x) => Product.fromJson(x)));
      //Product.fromJson(json.decode(res.body as List)).;
      return data;
    } else {
      return throw 'Error From Network';
    }
  }
}
