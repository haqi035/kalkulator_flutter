import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_provider.dart';
import 'calculator_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}
