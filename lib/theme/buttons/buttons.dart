import 'package:flutter/material.dart';
import 'package:oepaga/theme/index.dart';

final elevatedButtonStyle = ElevatedButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ThemeColors.primary),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 5, horizontal: 10))));
