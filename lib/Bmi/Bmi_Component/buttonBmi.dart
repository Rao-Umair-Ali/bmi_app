import 'package:flutter/material.dart';

Widget bmiButton(VoidCallback calculateBmi) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 100,
      child:
          ElevatedButton(onPressed: calculateBmi, child: const Text("Convert")),
    ),
  );
}
