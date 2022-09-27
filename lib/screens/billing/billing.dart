import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oepaga/layout/index.dart';
import 'package:oepaga/theme/index.dart';

class BillingScreen extends StatelessWidget {
  final String id;
  final Widget body;
  final bool isNoFloating;
  const BillingScreen(
      {Key? key,
      required this.id,
      required this.body,
      this.isNoFloating = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
        idBilling: id,
        floatingActionButton: isNoFloating
            ? null
            : FloatingActionButton(
                onPressed: () {
                  context.push('/list/billing/$id/new');
                },
                backgroundColor: ThemeColors.primary,
                child: const Icon(Icons.add_card_sharp),
              ),
        body: SizedBox(child: body));
  }
}
