import 'package:flutter/material.dart';
//reatividade
// class Controller {
//   var counter$ = ValueNotifier(0);

//   int get counter => counter$.value;

//   void increment() => counter$.value++;
// }

class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  incriment() => value++;
  decrement() => value--;
}
