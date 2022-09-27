import 'package:flutter/material.dart';

class Picker extends StatelessWidget {
  final String? value;
  final Function(String) onChanged;
  final String? placeholder;
  final List<DropdownMenuItem<String>>? items;

  const Picker(
      {Key? key,
      required this.value,
      required this.onChanged,
      this.items = const [],
      this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: items,
      hint: placeholder != null ? Text(placeholder!) : null,
      elevation: 1,
      onChanged: (value) {
        onChanged(value.toString());
      },
      isExpanded: true,
    );
  }
}
