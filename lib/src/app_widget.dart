import 'package:flutter/material.dart';
import 'package:value_notifier/src/home/home_page.dart';

class AppWiget extends StatelessWidget {
  const AppWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Homepage(),
      ),
    );
  }
}
