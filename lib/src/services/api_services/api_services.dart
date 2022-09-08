import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:muroexe_store/src/core/constants/helper/error_snackbar.dart';
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

  Future<Product?> singleProduct() async {
    try {
      var res = await getMethod(getLink: 'products/2');
      if (res.statusCode == 200) {
        return Product.fromJson(json.decode(res.body));
      } else {
        print('else statement');
        SnackBarWidget().showErrorSnackBar('Else Statement');
        // throw 'Error From Network';
      }
    } on SocketException {
      print('this is a socket exception');
      SnackBarWidget()
          .showErrorSnackBar('You don\'t have an internet connection');
      // throw 'You don\'t have an internet connection';
    } catch (ex, stackTrace) {
      print('''This is an exception coming from 
      ${ex.toString()}
      stackTrace is: $stackTrace
      ''');
      SnackBarWidget().showErrorSnackBar(ex.toString());
    }
  }

  Future<List<ProductList>?> limitedProduct() async {
    try {
      var res = await getMethod(getLink: 'products?limit=5');

      if (res.statusCode == 200) {
        List<ProductList> data = List<ProductList>.from(json
            .decode(res.body)
            .map((x) => ProductList.fromProductList(x))).toList();
        return data;
      } else {
        print('else brace in productList');
        SnackBarWidget().showErrorSnackBar('Error From Network');

        ///throw 'Error From Network';
      }
    } on SocketException {
      print('this is a socket exception for ProductList');
      SnackBarWidget()
          .showErrorSnackBar('You don\'t have an internet connection');
      //  throw 'You don\'t have an internet connection';
    } catch (ex, stackTrace) {
      print('''This is an exception coming from 
      ${ex.toString()}
      stackTrace is: $stackTrace
      ''');
      SnackBarWidget().showErrorSnackBar(ex.toString());
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
    // print('This is the res ${res.body}');

    try {
      if (res.statusCode == 200) {
        print(res.body);
        showSnackBar(context, 'before the 200');

        if (res.body.toString() == 'username or password is incorrect') {
          showSnackBar(context, 'username or password is incorrect');
        } else {
          var token = jsonDecode(res.body);
          var resText = token['token'];
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
