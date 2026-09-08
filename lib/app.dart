
import 'package:flutter/material.dart';

class PogoApp extends StatelessWidget {
  const PogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pogo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Text('Pogo'),
    );
  }
}
