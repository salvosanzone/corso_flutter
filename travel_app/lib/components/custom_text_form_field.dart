import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint_text;
  final IconData;
  const CustomTextFormField({Key? key, required this.hint_text, required this.IconData, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        prefixIcon: IconData,
        hintText: hint_text,
        labelStyle: const TextStyle(color: Colors.blue),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade700,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
        ),
      ),
      validator: (value) {
        if(value == null || value.isEmpty) {
          return 'Inserire un username';
        }
        if(value != 'salvo') {
          return 'Username non valido';
        }
        return null;
      },
    );
  }
}
