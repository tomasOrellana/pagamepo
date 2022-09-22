import 'package:flutter/material.dart';
import 'package:oepaga/theme/buttons/buttons.dart';
import 'package:oepaga/theme/index.dart';

class AppLightTheme {
  static ThemeData configureAppTheme() {
    var customColorTheme = _configureColorTheme();
    final customAppBarTheme = configureAppBarTheme(customColorTheme);
    return customAppBarTheme;
  }

  static ThemeData _configureColorTheme() {
    final customColorTheme = ThemeData(
      primaryColor: ThemeColors.text,
      primaryColorDark: ThemeColors.text,
      primaryColorLight: ThemeColors.text,
      colorScheme: ColorScheme.fromSwatch(),
      fontFamily: 'Roboto',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: elevatedButtonStyle,
      /* inputDecorationTheme: _configureInputDecorationTheme(), */
    );
    return customColorTheme;
  }
}
