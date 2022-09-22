final List<String> mainScreens = [
  AppPage.home.toPath,
  AppPage.listItem.toPath,
  AppPage.newItem.toPath,
  AppPage.profile.toPath,
  AppPage.options.toPath
];

enum AppPage { home, members, newItem, listItem, profile, options }

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.home:
        return '/home';
      case AppPage.members:
        return '/members';
      case AppPage.newItem:
        return '/new';
      case AppPage.listItem:
        return '/list';
      case AppPage.profile:
        return '/profile';
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
      default:
        return 'Home';
    }
  }
}

String getAppBarTitle(String path) {
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
    default:
      return AppPage.listItem.toTitle;
  }
}
