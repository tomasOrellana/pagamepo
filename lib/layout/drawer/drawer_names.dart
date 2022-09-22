import 'package:flutter/material.dart';
import 'package:oepaga/router/route_names.dart';

final List<Map<String, dynamic>> items = [
  {
    'text': 'lista',
    'icon': Icons.list_alt_sharp,
    'route': AppPage.listItem.toPath
  },
  {
    'text': 'nuevo',
    'icon': Icons.add_circle_sharp,
    'route': AppPage.newItem.toPath
  },
  {
    'text': 'perfil',
    'icon': Icons.person_add_alt_1_sharp,
    'route': AppPage.profile.toPath
  },
  {
    'text': 'opciones',
    'icon': Icons.settings_sharp,
    'route': AppPage.options.toPath
  }
];
