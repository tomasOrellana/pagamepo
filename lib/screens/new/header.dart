import 'package:flutter/material.dart';
import 'package:oepaga/theme/index.dart';
import 'package:oepaga/widgets/index.dart';

class HeaderNewScreen extends StatelessWidget {
  final TextEditingController controllerName;
  final Function() onAddElement;
  final Function(String) onChangeElement;
  const HeaderNewScreen(
      {Key? key,
      required this.controllerName,
      required this.onAddElement,
      required this.onChangeElement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Input(
            controller: controllerName,
            hintText: 'Nombre de nueva cuenta',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Debes ingresar un nombre.';
              }
              return null;
            },
          ),
        ),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                        contentPadding: const EdgeInsets.all(20),
                        children: [
                          Input(
                              hintText: 'Nombre miembro',
                              onChanged: (val) => onChangeElement(val)),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () => onAddElement(),
                              child: const Text('Agregar'))
                        ],
                      ));
            },
            color: ThemeColors.primary,
            splashColor: ThemeColors.secondary,
            icon: const Icon(
              Icons.add_circle,
              size: 30,
              color: ThemeColors.secondary,
            ))
      ],
    );
  }
}
