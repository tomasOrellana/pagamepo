import 'package:flutter/material.dart';
import 'package:oepaga/layout/index.dart';
import 'package:oepaga/providers/index.dart';
import 'package:oepaga/screens/list/empty.dart';
import 'package:oepaga/widgets/index.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context);
    final billsInfo = billProvider.billsInfo;
    return AppWrapper(
        body: billsInfo.isEmpty
            ? const EmptyScreen()
            : ListView.builder(
                itemCount: billsInfo.length,
                itemBuilder: (context, index) {
                  return billCard(bill: billsInfo[index]);
                }));
  }
}
