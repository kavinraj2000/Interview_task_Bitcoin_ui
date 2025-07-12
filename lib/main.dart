import 'package:flutter/material.dart';
import 'package:interview/app/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const App(),
    );
  }
}
