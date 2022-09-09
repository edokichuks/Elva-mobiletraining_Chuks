import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:muroexe_store/src/app/app.dart';
import 'package:muroexe_store/src/core/constants/helper/snackbar_services.dart';
import 'package:muroexe_store/src/models/product_list/product_list.dart';
import 'package:muroexe_store/src/models/signin.dart';
import 'package:muroexe_store/src/services/base/failutre.dart';

import '../../models/product.dart';

@lazySingleton
class ApiServices {
  static const String apiBase = 'https://fakestoreapi.com/';
  final _snackbarService = locator<SnackServices>();

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
        SnackServices().showErrorSnackBar('Else Statement');
        // throw 'Error From Network';
      }
    } on SocketException {
      print('this is a socket exception');
      SnackServices()
          .showErrorSnackBar('You don\'t have an internet connection');
      // throw 'You don\'t have an internet connection';
    } catch (ex, stackTrace) {
      print('''This is an exception coming from 
      ${ex.toString()}
      stackTrace is: $stackTrace
      ''');
      SnackServices().showErrorSnackBar(ex.toString());
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
        SnackServices().showErrorSnackBar('Error From Network');

        ///throw 'Error From Network';
      }
    } on SocketException {
      print('this is a socket exception for ProductList');
      SnackServices()
          .showErrorSnackBar('You don\'t have an internet connection');
      //  throw 'You don\'t have an internet connection';
    } catch (ex, stackTrace) {
      print('''This is an exception coming from 
      ${ex.toString()}
      stackTrace is: $stackTrace
      ''');
      SnackServices().showErrorSnackBar(ex.toString());
    }
  }

  Future signIn(Signin signInData) async {
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
        _snackbarService.showErrorSnackBar('before the 200');

        if (res.body.toString() == 'username or password is incorrect') {
          _snackbarService
              .showErrorSnackBar('username or password is incorrect');
        } else {
          var token = jsonDecode(res.body);
          var resText = token['token'];
          print(resText);
          _snackbarService.showErrorSnackBar('Signed In Successfully');
        }

        print('''
          res body
          ${res.body}
          ''');
      } else if (res.statusCode == 401) {
        print('error user name and password');
        _snackbarService.showErrorSnackBar(res.body);
      } else {
        print(res.statusCode);
        print(res.reasonPhrase);

        _snackbarService.showErrorSnackBar(res.reasonPhrase.toString());
        return res.statusCode;
      }
    } on SocketException {
      print('this is a socket exception');
      throw Failure('You don\'t have an internet connection');

      /// return 'You don\'t have an internet connection';
    } on FormatException {
      throw Failure('Username or password is incorrect at format');
    } on Failure catch (ex) {
      throw Failure(ex.message);
    }
  }
}
