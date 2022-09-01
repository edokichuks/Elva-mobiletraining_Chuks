import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:muroexe_store/src/core/constants/helper/show_snackbar.dart';
import 'package:muroexe_store/src/models/product_list/product_list.dart';
import 'package:muroexe_store/src/models/signin.dart';

import '../../models/product.dart';

@lazySingleton
class ApiServices {
  static const String apiBase = 'https://fakestoreapi.com/';

  postMethod({data, apiUrl}) async {
    var headers = {'Content-Type': 'application/json'};
    var fullUrl = apiBase + apiUrl;
    var request = http.Request(
      'POST',
      Uri.parse(fullUrl),
    );

    request.body = json.encode(data);
    request.headers.addAll(headers);

    var response = await request.send();
    return response;
  }

  static getMethod({getLink}) async {
    var fullUrl = apiBase + getLink;

    return await http.get(Uri.parse(fullUrl));
  }

  Future<Product> singleProduct() async {
    var res = await getMethod(getLink: 'products/2');
    if (res.statusCode == 200) {
      return Product.fromJson(json.decode(res.body));
    } else {
      return throw 'Error From Network';
    }
  }

  Future<List<ProductList>> limitedProduct() async {
    var res = await getMethod(getLink: 'products?limit=5');

    if (res.statusCode == 200) {
      List<ProductList> data = List<ProductList>.from(
              json.decode(res.body).map((x) => ProductList.fromProductList(x)))
          .toList();
      return data;
    } else {
      return throw 'Error From Network';
    }
  }

  Future signIn(context, Signin signInData) async {
    var fullLink = 'https://fakestoreapi.com/auth/login';

    var res = await http.post(
      Uri.parse(fullLink),
      body: signInData.toJson(),

      ///Or use this
      /// jsonEncode(
      ///
      ///   signInData.toSignIn(),
      /// ),

      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    var token = jsonDecode(res.body);
    var resText = token['token'];
    try {
      if (res.statusCode == 200) {
        print(res.body);

        if (res.body.toString() == 'username or password is incorrect') {
          showSnackBar(context, 'username or password is incorrect');
        } else {
          print(resText);
          showSnackBar(context, 'Signed In Successfully');
        }

        print('''
          res body
          ${res.body}
          ''');

        //return resText;
      } else if (res.statusCode == 401) {
        print('error user name and password');
        showSnackBar(context, res.body);
      } else {
        print(res.statusCode);
        print(res.reasonPhrase);
        showSnackBar(context, '${res.reasonPhrase}');
        return res.statusCode;
      }
    } on SocketException {
      print('this is a socket exception');
      return 'You don\'t have an internet connection';
    } on FormatException {
      showSnackBar(context, 'username or password is incorrect at format');
    } catch (ex) {
      showSnackBar(context, ex.toString());
    }
  }
}
