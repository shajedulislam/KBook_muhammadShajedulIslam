import 'package:flutter/material.dart';
import 'package:kbook/kbook.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kbook(),
    );
  }
}
