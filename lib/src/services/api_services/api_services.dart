import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:muroexe_store/src/core/constants/helper/show_snackbar.dart';
import 'package:muroexe_store/src/models/signin.dart';

import '../../models/product.dart';

@lazySingleton
class ApiServices {
  //
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
    // return await http.post(Uri.parse(fullUrl),
    //     body: json.encode(data), headers: headers
    //     // headers: {'Content-type': 'application/json'},
    //     );
  }

  static getMethod({getLink}) async {
    var fullUrl = apiBase + getLink;

    return await http.get(Uri.parse(fullUrl));
  }

  Future<Product> singleProduct() async {
    //https: //fakestoreapi.com/products?limit=5

    var res = await getMethod(getLink: 'products/4');
    if (res.statusCode == 200) {
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
          json.decode(res.body).map((x) => Product.fromJson(x))).toList();
      //Product.fromJson(json.decode(res.body as List)).;
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

        print(resText);
        if (res.body.compareTo('username or password is incorrect') == true) {
          showSnackBar(context, 'username or password is incorrect');
        } else {
          showSnackBar(context, 'Signed In Successfully');
        }

        //return resText;
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
