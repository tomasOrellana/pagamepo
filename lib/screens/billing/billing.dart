import 'package:flutter/material.dart';
import 'package:oepaga/layout/index.dart';

class BillingScreen extends StatelessWidget {
  final String id;
  const BillingScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
        idBilling: id, body: const SizedBox(child: Text('bills')));
  }
}
