import 'dart:convert';
import 'package:homework_11_2/model/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> getAllProduct() async {
  try {
    Uri uri = Uri.parse("https://dummyjson.com/products");
    var responce = await http.get(uri);
    var listOfMaps = jsonDecode(responce.body);
    if (responce.statusCode == 200) {
      List<ProductModel> listOfProducts = [];
      for (var i = 0; i < 30; i++) {
        var product = ProductModel.fromMapToObject(listOfMaps['products'][i]);
        listOfProducts.add(product);
      }
      return listOfProducts;
    } else {
      return [
        ProductModel(
            id: -1,
            title: 'Exception',
            description: 'check your internet connection',
            price: 0.0,
            rating: 0.0,
            thumbnail: '')
      ];
    }
  } catch (e) {
    return [
      ProductModel(
          id: -1,
          title: 'Exception',
          description: 'check your internet connection',
          price: 0.0,
          rating: 0.0,
          thumbnail: '')
    ];
  }
}
