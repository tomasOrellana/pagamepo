import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? initialValue;
  final TextEditingController? controller;
  const Input(
      {Key? key,
      this.hintText,
      this.validator,
      this.onChanged,
      this.initialValue,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: validator,
      onChanged: onChanged,
      initialValue: initialValue,
    );
  }
}
