import 'package:flutter/material.dart';
import 'package:oepaga/models/index.dart';
import 'package:oepaga/screens/index.dart';

class BillProvider extends ChangeNotifier {
  // TODO: clean bill initial when database is working
  List<Bill> _bills = [
    Bill(id: uuid.v4(), name: 'Carrete 18', members: [
      Member(name: 'Tomas', id: uuid.v4()),
      Member(name: 'Anto', id: uuid.v4()),
      Member(name: 'Duss', id: uuid.v4()),
      Member(name: 'Fran', id: uuid.v4()),
      Member(name: 'Pollo', id: uuid.v4())
    ])
  ];
  late Bill _selectedBill;

  List<Bill> get billsInfo => _bills;
  set billsInfo(List<Bill> value) {
    _bills = value;
    notifyListeners();
  }

  Bill get selectedBill => _selectedBill;
  set selectedBill(Bill bill) {
    _selectedBill = bill;
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
