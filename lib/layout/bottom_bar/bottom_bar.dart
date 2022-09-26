import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oepaga/theme/index.dart';

class BottomNavbar extends StatefulWidget {
  final String idBilling;
  const BottomNavbar({Key? key, required this.idBilling}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _NavbarState();
}

class _NavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final router = GoRouter.of(context);
    List<Map<String, dynamic>> buttonIcons = [
      {'name': 'Gastos', 'route': '/list/billing/${widget.idBilling}'},
      {'name': 'Resumen', 'route': '/list/billing/${widget.idBilling}/resume'},
    ];

    return SafeArea(
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Platform.isAndroid ? ThemeColors.white : null,
          ),
          child: Row(
              children: buttonIcons.map((e) {
            int i = buttonIcons.indexOf(e);
            double width = MediaQuery.of(context).size.width;
            return InkWell(
              onTap: () {
                setState(() {
                  context.go(buttonIcons[i]['route']!);
                });
              },
              child: SizedBox(
                width: (width) / buttonIcons.length,
                child: Center(
                  child: Text(buttonIcons[i]['name']!,
                      style: ThemeTexts.bold16(
                          c: isDarkMode
                              ? darkModeColor(
                                  router.location == buttonIcons[i]['route']!)
                              : lightModeColor(router.location ==
                                  buttonIcons[i]['route']!))),
                ),
              ),
            );
          }).toList())),
    );
  }
}

Color? lightModeColor(bool isSelected) {
  return isSelected ? ThemeColors.secondary : ThemeColors.white;
}

Color? darkModeColor(bool isSelected) {
  return isSelected ? ThemeColors.secondary : ThemeColors.white;
}
