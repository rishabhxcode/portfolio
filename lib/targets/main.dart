import 'package:flutter/material.dart';
import 'package:portfolio/modules/home/screens/portfolio_home.dart';

import '../modules/home/screens/desktop_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PortfolioHome(),
    );
  }
}
