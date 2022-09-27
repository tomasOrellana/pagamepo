import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oepaga/providers/index.dart';
import 'package:oepaga/theme/index.dart';
import 'package:oepaga/widgets/index.dart';
import 'package:provider/provider.dart';

// Define a custom Form widget.
class NewBillingForm extends StatefulWidget {
  const NewBillingForm({super.key});

  @override
  NewBillingFormState createState() {
    return NewBillingFormState();
  }
}

class NewBillingFormState extends State<NewBillingForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? date = DateTime.now();
  String? owner;
  List<Map<String, Object>> membersValue = [];
  bool isLoaded = false;
  int value = 1;
  int selectedsQuant = 0;

  void setDate(DateTime? newDate) async {
    setState(() {
      date = newDate;
    });
  }

  void recalculateValues() {
    setState(() {
      if (selectedsQuant > 0) {
        for (var element in membersValue) {
          if (element['value'] == true) {
            final amount = value / selectedsQuant;
            element['amount'] = amount.round();
          } else {
            element['amount'] = 0;
          }
        }
      } else {
        for (var element in membersValue) {
          element['amount'] = 0;
        }
      }
    });
  }

  void recalculateSelecteds(bool? value, idx) {
    setState(() {
      membersValue[idx]['value'] = value!;
      if (value == true) {
        selectedsQuant++;
      } else {
        selectedsQuant--;
      }
      recalculateValues();
    });
  }

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context);
    final members = billProvider.selectedBill.members;
    if (!isLoaded) {
      isLoaded = true;
      membersValue = members
          .map((e) => {'name': e.name, 'value': false, 'amount': 0})
          .toList();
    }
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Input(
            hintText: 'Nombre del gasto',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Input(
                  margin: const EdgeInsets.only(right: 5),
                  initialValue: '1',
                  hintText: 'Valor \$',
                  suffixText: '\$',
                  onChanged: (val) {
                    if (val.isNotEmpty && val[0] != '0') {
                      value = int.parse(val);
                      recalculateValues();
                    }
                  },
                  validator: (value) {
                    if (value == null || int.parse(value) < 0) {
                      return 'El valor debe ser mayor a 0';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  isDigit: true,
                ),
              ),
              Expanded(
                flex: 2,
                child: DatePicker(date: date, setDate: setDate),
              )
            ],
          ),
          Picker(
              value: owner,
              onChanged: (value) {
                setState(() {
                  owner = value;
                });
              },
              placeholder: 'Miembro quien pagó',
              items: members
                  .map(
                      (e) => DropdownMenuItem(value: e.id, child: Text(e.name)))
                  .toList()),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 0),
              child: Text('Participantes', style: ThemeTexts.bold18())),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: members.map((e) {
                  final idx = members.indexOf(e);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: membersValue[idx]['value'] as bool,
                        onChanged: (bool? value) =>
                            recalculateSelecteds(value, idx),
                      ),
                      Expanded(child: Text(e.name)),
                      Text('${membersValue[idx]['amount']} \$')
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
                onPressed: () {},
                label: const Text('Añadir'),
                icon: const Icon(Icons.add_sharp)),
          )
        ],
      ),
    );
  }
}
