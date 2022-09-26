import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oepaga/models/index.dart';
import 'package:oepaga/theme/index.dart';

class BillCard extends StatelessWidget {
  const BillCard({
    Key? key,
    required this.bill,
  }) : super(key: key);

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade100,
      elevation: 2,
      margin: const EdgeInsets.all(5),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(100),
        onTap: () {
          context.push('/list/billing/${bill.id}');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bill.name,
                        style: ThemeTexts.semibold16(c: ThemeColors.primary)),
                    Row(
                      children: [
                        ...bill.members.map((e) => Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child:
                                  Text(e.name, style: ThemeTexts.regular10()),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              const Icon(Icons.arrow_right,
                  size: 40, color: ThemeColors.primary)
            ],
          ),
        ),
      ),
    );
  }
}
