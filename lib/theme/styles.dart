import 'package:flutter/material.dart';
import 'package:oepaga/theme/index.dart';

ThemeData configureAppBarTheme(ThemeData customTextTheme) {
  return customTextTheme.copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 1.0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: ThemeColors.lightColor),
    ),
  );
}
