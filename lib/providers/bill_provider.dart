import 'package:flutter/material.dart';
import 'package:oepaga/models/index.dart';

class BillProvider extends ChangeNotifier {
  List<Bill> _bills = [];

  List<Bill> get billsInfo => _bills;
  set billsInfo(List<Bill> value) {
    _bills = value;
    notifyListeners();
  }

  void addBill(Bill value) {
    _bills.add(value);
    notifyListeners();
  }

  void removeBill(int index) {
    _bills.removeAt(index);
    notifyListeners();
  }
}
