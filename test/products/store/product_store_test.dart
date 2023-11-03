import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:value_notifier/products/services/products_service.dart';
import 'package:value_notifier/products/state/product_state.dart';
import 'package:value_notifier/products/store/product_store.dart';

class ProductServiceMock extends Mock implements ProductService {}

void main() {
  final service = ProductServiceMock();
  final store = ProductStore(service);
  test('deve alterar estado para sucesso', () async {
    when(() => service.fetchProducts()).thenAnswer((_) async => []);
    await store.fetchProducts();
    expect(store.value, isA<SuccessProdcuctState>());
  });

  test('deve alterar estado para erro', () async {
    when(() => service.fetchProducts()).thenThrow(Exception('Error'));
    await store.fetchProducts();
    expect(store.value, isA<ErroProductState>());
  });
}
