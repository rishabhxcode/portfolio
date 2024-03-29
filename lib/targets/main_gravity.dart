import 'package:flutter/material.dart';

import '../modules/flutter_gravity/screens/gravity_home.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home:  GravityHome(),
    );
  }
}
