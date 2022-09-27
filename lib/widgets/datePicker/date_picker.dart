import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    Key? key,
    required this.date,
    required this.setDate,
  }) : super(key: key);

  final DateTime? date;
  final Function(DateTime?) setDate;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(date != null ? date! : DateTime.now());
    return ElevatedButton(
      onPressed: () async {
        final newDate = await showDatePicker(
            locale: const Locale('es', ''),
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100));
        setDate(newDate);
      },
      child: Row(
        children: [
          const Icon(Icons.date_range_sharp),
          const SizedBox(width: 10),
          Text(formattedDate),
        ],
      ),
    );
  }
}
