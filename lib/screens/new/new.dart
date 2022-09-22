import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oepaga/layout/index.dart';
import 'package:oepaga/models/index.dart';
import 'package:oepaga/providers/index.dart';
import 'package:oepaga/screens/new/form.dart';
import 'package:oepaga/screens/new/header.dart';
import 'package:provider/provider.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  String newElement = '';
  List<Map<String, dynamic>> values = [];

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }

  void onUpdate(int key, String value) {
    int foundedKey = -1;
    for (var map in values) {
      if (map.containsKey('id')) {
        if (map['id'] == key) {
          foundedKey = key;
          break;
        }
      }
    }
    if (foundedKey != -1) {
      values.removeWhere((element) => element['id'] == key);
    }
    Map<String, dynamic> json = {'id': key, 'name': value};
    setState(() {
      values.add(json);
    });
  }

  void onDelete(int key) {
    setState(() {
      values.removeAt(key);
    });
  }

  void onAddElement() {
    Map<String, dynamic> json = {'id': values.length, 'name': newElement};
    setState(() {
      values.add(json);
      newElement = '';
    });
    Navigator.pop(context);
  }

  void onChangeElement(String val) {
    setState(() {
      newElement = val;
    });
  }

  void onPressNext() {
    final billProvider = Provider.of<BillProvider>(context, listen: false);
    final List<Member> newMembers = [
      ...values.map((e) => Member(name: e['name']))
    ];
    final newBill = Bill(name: controllerName.value.text, members: newMembers);
    billProvider.addBill(newBill);
    context.go('/list');
  }

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
        body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderNewScreen(
                controllerName: controllerName,
                onAddElement: onAddElement,
                onChangeElement: onChangeElement),
            MembersForm(values: values, onUpdate: onUpdate, onDelete: onDelete),
            if (values.length > 1)
              ElevatedButton(
                onPressed: () => onPressNext(),
                child: const Text('Continuar'),
              )
          ],
        ),
      ),
    ));
  }
}
