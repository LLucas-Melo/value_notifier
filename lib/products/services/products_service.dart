// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uno/uno.dart';
import 'package:value_notifier/products/model/product_model.dart';

class ProductService {
  final Uno uno;
  ProductService(
    this.uno,
  );

  Future<List<ProductModel>> fetchProducts() async {
    final response = await uno.get('http://localhost:3031/products');
    final list = response.data as List;
    final products = list.map((e) => ProductModel.fromMap(e)).toList();

    return products;
  }
}
