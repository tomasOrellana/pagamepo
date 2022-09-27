import 'package:flutter/material.dart';
import 'package:oepaga/screens/index.dart';

class ResumeBillingScreen extends StatelessWidget {
  final String id;
  const ResumeBillingScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BillingScreen(id: id, body: const SizedBox(child: Text('resume')));
  }
}
