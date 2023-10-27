import 'package:flutter/material.dart';
import 'package:value_notifier/src/home/home_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final counter = Counter();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aula de valueNotify'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Quanta vezes voce clicou '),
            ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (context, value, child) {
                return Text('$value');
              },
            ),
            SizedBox(height: 150),
            FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: counter.incriment,
              child: Text('clique'),
            )
          ],
        ),
      ),
    );
  }
}
