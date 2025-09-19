import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const KrishiMithraApp());
}

class KrishiMithraApp extends StatelessWidget {
  const KrishiMithraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krishi Mithra',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
