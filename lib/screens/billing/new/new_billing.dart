import 'package:flutter/material.dart';
import 'package:oepaga/screens/billing/new/new_billing_form.dart';
import 'package:oepaga/screens/index.dart';

class NewBillingScreen extends StatelessWidget {
  final String id;
  const NewBillingScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BillingScreen(
        id: id,
        isNoFloating: true,
        body: SizedBox(
            child: Column(
          children: const [NewBillingForm()],
        )));
  }
}
