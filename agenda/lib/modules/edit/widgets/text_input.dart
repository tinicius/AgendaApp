import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  TextInput({Key? key, required this.labelText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Vázio';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
