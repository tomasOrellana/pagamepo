import 'package:flutter/material.dart';
import 'package:oepaga/providers/index.dart';
import 'package:provider/provider.dart';

final List<String> mainScreens = [
  AppPage.home.toPath,
  AppPage.listItem.toPath,
  AppPage.newItem.toPath,
  AppPage.profile.toPath,
  AppPage.options.toPath
];

final List<String> subScreens = ['/list/'];

enum AppPage { home, members, newItem, listItem, profile, options, billing }

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.home:
        return '/';
      case AppPage.members:
        return '/members';
      case AppPage.newItem:
        return '/new';
      case AppPage.listItem:
        return '/list';
      case AppPage.profile:
        return '/profile';
      case AppPage.billing:
        return '/billing';
      default:
        return '/list';
    }
  }

  String get toName {
    switch (this) {
      case AppPage.home:
        return 'home';
      case AppPage.members:
        return 'members';
      case AppPage.newItem:
        return 'new';
      case AppPage.listItem:
        return 'list';
      case AppPage.profile:
        return 'profile';
      case AppPage.options:
        return 'options';
      case AppPage.billing:
        return 'billing';
      default:
        return 'home';
    }
  }

  String get toTitle {
    switch (this) {
      case AppPage.home:
        return 'inicio';
      case AppPage.members:
        return 'Participantes';
      case AppPage.newItem:
        return 'Nuevo';
      case AppPage.listItem:
        return '💸💸💸💸';
      case AppPage.profile:
        return 'Perfil';
      case AppPage.options:
        return 'Opciones';
      case AppPage.billing:
        return 'Cuenta';
      default:
        return 'Home';
    }
  }
}

String getAppBarTitle(String path, BuildContext context) {
  switch (path) {
    case '/home':
      return AppPage.home.toTitle;
    case '/members':
      return AppPage.members.toTitle;
    case '/new':
      return AppPage.newItem.toTitle;
    case '/list':
      return AppPage.listItem.toTitle;
    case '/options':
      return AppPage.options.toTitle;
    case '/profile':
      return AppPage.profile.toTitle;
    case '/billing':
      return AppPage.billing.toTitle;
    default:
      String? routeParam;
      for (final route in subScreens) {
        if (path.contains('billing')) {
          final id = path.split('/')[3];
          final billProvider = Provider.of<BillProvider>(context);
          final name = billProvider.billsInfo
              .firstWhere((element) => element.id == id)
              .name;
          return name;
        }
        if (path.contains(route)) {
          routeParam = path.split(route)[1];
          routeParam = routeParam.split('/')[0];
          return routeParam;
        }
      }
      return path;
  }
}
