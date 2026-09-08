
import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_theme.dart';

class PogoApp extends StatelessWidget {
  const PogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pogo',
      theme: AppTheme.light,
      home: const Text('Pogo'),
    );
  }
}
