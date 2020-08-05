import 'dart:convert';
import 'package:Amazon/src/models/login_model.dart';
import 'package:Amazon/src/models/product.dart';
import 'package:Amazon/src/screens/Categories/Laptops/laptopdata.dart';
import 'package:Amazon/src/screens/Categories/Mobiles/mobiledata.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

var baseUrl = DotEnv().env['Base_URL'];
Future<List<Mobiles>> fetchProdMobile() async {
  String url = baseUrl + "/mobiles";

  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});
  return mobilesFromJson(response.body);
}

Future<List<Laptops>> fetchProdLaptop() async {
  String url = baseUrl + "/Laptops";

  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});
  return laptopsFromJson(response.body);
}

Future<List<ProductsData>> fetchProducts() async {
  String url = baseUrl + "/products";

  final response = await http.get(url, headers: {
    "Content-Type": "application/json"
  }).timeout(Duration(seconds: 5));
  return productsFromJson(response.body);
}

Future<Login> ud(String name) async {
  String url = baseUrl + "/userdetails/$name";

  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});

  final jsonresponse = json.decode(response.body);
  print(response.body);
  if (response.statusCode == 200) {
    return Login.fromJson(jsonresponse[0]);
  } else {
    return null;
  }
}
