import 'package:flutter/material.dart';
import 'package:oepaga/layout/index.dart';
import 'package:oepaga/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Header(title: 'Bienvenido', subTitle: 'oepagamepo!'),
      ],
    ));
  }
}
