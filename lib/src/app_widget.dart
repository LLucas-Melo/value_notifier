import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier/products/product_page.dart';
import 'package:value_notifier/products/services/products_service.dart';
import 'package:value_notifier/products/store/product_store.dart';

class AppWiget extends StatelessWidget {
  const AppWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Uno()),
        Provider(create: (context) => ProductService(context.read())),
        ChangeNotifierProvider(
          create: (context) => ProductStore(
            ProductService(
              context.read(),
            ),
          ),
        )
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: ProductPage(),
        ),
      ),
    );
  }
}
