import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier/products/services/products_service.dart';
import 'package:value_notifier/products/state/product_state.dart';
import 'package:value_notifier/products/store/product_store.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductStore>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<ProductStore>();
    final state = store.value;
    Widget? child;

    if (state is LoadingProductState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorProductState) {
      print('oi com erro');
      child = Center(
        child: Text(state.menssagem),
      );
    }
    if (state is SuccessProductState) {
      child = ListView.builder(
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          final product = state.products[index];
          print(product.title);
          return ListTile(
            title: Text(product.title),
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: child ?? Container(),
    );
  }
}
