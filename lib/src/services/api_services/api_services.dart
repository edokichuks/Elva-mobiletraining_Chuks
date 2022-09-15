import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:muroexe_store/src/models/product/product.dart';
import 'package:muroexe_store/src/models/signin.dart';
import 'package:muroexe_store/src/services/base/failure.dart';

const String scheme = 'https';
const String host = 'fakestoreapi.com';

Uri singleProductUri({required int id}) =>
    Uri(scheme: scheme, host: host, path: '/products/$id');
Uri limitedProductUri({required int limit}) =>
    Uri(scheme: scheme, host: host, path: '/products', query: 'limit=$limit');
Uri allProducts = Uri(scheme: scheme, host: host, path: '/products');
Uri signInUri = Uri(scheme: scheme, host: host, path: '/auth/login');

class ApiServices {
  final _client = Client();

  Future<Response> _post(
      {required Map<String, dynamic> data, required Uri uri}) async {
    log('Making request to $uri');
    final Response response = await _client.post(uri, body: data);
    log('Response from $uri\n ${response.body}');
    return response;
  }

  Future<Response> _getMethod({required Uri uri}) async {
    log('Making request to $uri');
    final Response response = await _client.get(uri);
    log('Response from $uri\n ${response.body}');
    return response;
  }

  Future<Product> singleProduct() async {
    try {
      Response res = await _getMethod(uri: singleProductUri(id: 3));
      Map<String, dynamic> decodedResponse = jsonDecode(res.body);
      return Product.fromJson(decodedResponse);
    } on SocketException catch (ex, stackTrace) {
      throw Failure(
          message: 'You don\'t have internet connection',
          devMessage: stackTrace.toString());
    } catch (ex, stackTrace) {
      throw Failure(
          message: 'Try again',
          devMessage: 'Error:$ex, Stacktrace: $stackTrace');
    }
  }

  Future<List<Product>> limitedProduct() async {
    try {
      Response res = await _getMethod(uri: limitedProductUri(limit: 5));
      List<Product> data = List<Product>.from(
          json.decode(res.body).map((x) => Product.fromJson(x))).toList();
      return data;
    } on SocketException catch (ex, stackTrace) {
      throw Failure(
          message: 'You don\'t have internet connection',
          devMessage: stackTrace.toString());
    } catch (ex, stackTrace) {
      throw Failure(
          message: 'Try again',
          devMessage: 'Error:$ex, Stacktrace: $stackTrace');
    }
  }

  Future signIn(Signin signInData) async {
    try {
      log('Attempting to sign in');
      //Response res =
      await _post(data: signInData.toSignIn(), uri: signInUri);
      // if (res.body.toString() == 'username or password is incorrect') {
      //   const Failure(
      //       message: 'username or password is incorrect',
      //       devMessage: 'devMessage: username or password is incorrect');
      // }
      log('Signed successfully');
    } on SocketException catch (ex, stackTrace) {
      throw Failure(
          message: 'You don\'t have internet connection',
          devMessage: stackTrace.toString());
    } on FormatException {
      throw const Failure(
        message: 'Username or password is incorrect',
        devMessage: 'Username or password is incorrect at format',
      );
    } catch (ex, stackTrace) {
      throw Failure(
          message: 'Try again',
          devMessage: 'Error:$ex, Stacktrace: $stackTrace');
    }
  }
}
