import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oepaga/theme/index.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('no hay cuentas :(',
            style: ThemeTexts.bold24(c: ThemeColors.primary)),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              context.go('/new');
            },
            child: const Text('Crear una cuenta')),
      ],
    ));
  }
}
