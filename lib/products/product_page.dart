import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina dos produtos'),
      ),
      body: ListView.builder(itemBuilder: (_, index) {
        return ListTile();
      }),
    );
  }
}
