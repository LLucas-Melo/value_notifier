import 'package:value_notifier/products/model/product_model.dart';

abstract class ProductState {}

class InicialProductState extends ProductState {}

class SuccessProdcuctState extends ProductState {
  final List<ProductModel> product;

  SuccessProdcuctState(this.product);
}

class LoadingProductState extends ProductState {}

class ErroProductState extends ProductState {
  final String menssagem;

  ErroProductState(this.menssagem);
}
