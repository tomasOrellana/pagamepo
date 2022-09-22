import 'package:flutter/material.dart';
import 'package:oepaga/theme/index.dart';
import 'package:oepaga/widgets/index.dart';

class MembersForm extends StatefulWidget {
  final List<Map<String, dynamic>> values;
  final Function(int, String) onUpdate;
  final Function(int) onDelete;
  const MembersForm(
      {Key? key,
      required this.values,
      required this.onUpdate,
      required this.onDelete})
      : super(key: key);

  @override
  State<MembersForm> createState() => _MembersFormState();
}

class _MembersFormState extends State<MembersForm> {
  String itemValue = '';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.values.length,
            itemBuilder: (context, index) {
              return _row(index);
            }),
      ),
    );
  }

  Widget _row(int key) {
    return Row(
      children: [
        Expanded(child: Text(widget.values[key]['name'])),
        IconButton(
            onPressed: () {
              widget.onDelete(key);
            },
            color: ThemeColors.primary,
            splashColor: ThemeColors.secondary,
            icon: const Icon(
              Icons.remove_circle,
              size: 30,
              color: ThemeColors.error,
            )),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                        contentPadding: const EdgeInsets.all(20),
                        children: [
                          Input(
                              initialValue: widget.values[key]['name'],
                              onChanged: (val) {
                                setState(() {
                                  itemValue = val;
                                });
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.onUpdate(key, itemValue);
                                  itemValue = '';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Editar'))
                        ],
                      ));
            },
            color: ThemeColors.primary,
            splashColor: ThemeColors.secondary,
            icon: const Icon(
              Icons.edit_rounded,
              size: 30,
              color: ThemeColors.tertiary,
            ))
      ],
    );
  }
}
