import 'package:bmi_app/Bmi/bmi_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiPage(),
    );
  }
}
