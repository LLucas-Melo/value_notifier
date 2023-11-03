import 'package:flutter/foundation.dart';

import 'package:value_notifier/products/services/products_service.dart';
import 'package:value_notifier/products/state/product_state.dart';

class ProductStore extends ValueNotifier<ProductState> {
  ProductStore(this.service) : super(InicialProductState());

  final ProductService service;
  Future fetchProducts() async {
    value = LoadingProductState();
    await Future.delayed(const Duration(seconds: 2)); //???
    try {
      final products = await service.fetchProducts();
      value = SuccessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
