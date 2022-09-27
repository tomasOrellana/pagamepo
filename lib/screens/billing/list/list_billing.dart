import 'package:flutter/material.dart';
import 'package:oepaga/screens/index.dart';

class ListBillingScreen extends StatelessWidget {
  final String id;
  const ListBillingScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BillingScreen(id: id, body: const SizedBox(child: Text('bills')));
  }
}
