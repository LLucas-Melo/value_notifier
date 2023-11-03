import 'package:value_notifier/products/model/product_model.dart';

abstract class ProductState {}

class InicialProductState extends ProductState {}

class SuccessProductState extends ProductState {
  final List<ProductModel> products;

  SuccessProductState(this.products);
}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final String menssagem;

  ErrorProductState(this.menssagem);
}
