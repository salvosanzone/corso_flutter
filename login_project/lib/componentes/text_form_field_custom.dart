import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hint_text;
  final IconData;
  final controllerForm;

  TextFormFieldCustom({Key? key, required this.hint_text, required this.IconData, required this.controllerForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerForm,
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
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      ),
      /*validator: (value) {
        if(value != && value.isNotEmpty && value.contains('@')) {
          return null;
        } else {
          return 'mail non valida';
        }
      },*/
    );
  }
}
