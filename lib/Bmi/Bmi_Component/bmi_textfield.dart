import 'package:flutter/material.dart';

Widget bmiTextField(
    String hintname, double heightField, TextEditingController bmivalues) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: heightField,
      child: TextField(
        controller: bmivalues,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(hintText: hintname),
      ),
    ),
  );
}
