import 'package:flutter/foundation.dart';

import 'package:value_notifier/products/services/products_service.dart';
import 'package:value_notifier/products/state/product_state.dart';

class ProductStore extends ValueNotifier<ProductState> {
  ProductStore(this.service) : super(InicialProductState());

  final ProductService service;
  Future fetchProducts() async {
    value = LoadingProductState();
    try {
      final products = await service.fetchProducts();
      value = SuccessProdcuctState(products);
    } catch (e) {
      value = ErroProductState(e.toString());
    }
  }
}
