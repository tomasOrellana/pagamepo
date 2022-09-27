import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? prefixText;
  final String? suffixText;
  final EdgeInsetsGeometry? margin;
  final bool enabled;
  final bool isDigit;
  const Input(
      {Key? key,
      this.isDigit = false,
      this.enabled = true,
      this.hintText,
      this.validator,
      this.onChanged,
      this.initialValue,
      this.controller,
      this.keyboardType,
      this.margin,
      this.prefixIcon,
      this.prefixText,
      this.suffixText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          suffixText: suffixText,
        ),
        validator: validator,
        onChanged: onChanged,
        initialValue: initialValue,
        keyboardType: keyboardType,
        enabled: enabled,
        inputFormatters: [
          if (isDigit)
            FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*')),
        ],
      ),
    );
  }
}
