import 'package:flutter/foundation.dart';
import 'package:value_notifier/products/model/product_model.dart';
import 'package:value_notifier/products/services/products_service.dart';

class ProductStore extends ValueNotifier<List<ProductModel>>{
  ProductStore(this.service) :super([]);

final ProductService service;
Future fetchProducts() async{
final products =  await service.fetchProducts();

value = products;
}


}