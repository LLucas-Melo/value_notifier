import 'package:flutter/material.dart';
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
  final store = ProductStore(ProductService(Uno()));

  @override
  void initState() {
    super.initState();
    store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, child) {
          print(state);

          if (state is LoadingProductState) {
            print('oi carregando');
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorProductState) {
            print('oi com erro');
            return Center(
              child: Text(state.menssagem),
            );
          }
          if (state is SuccessProductState) {
            print(state.products.length);
            return ListView.builder(
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
          return Container(
            width: 50,
            height: 50,
            color: Colors.amber,
          );
        },
      ),
    );
  }
}
