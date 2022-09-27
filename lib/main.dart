import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oepaga/providers/index.dart';
import 'package:oepaga/router/routes.dart';
import 'package:oepaga/theme/index.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<BillProvider>(create: (_) => BillProvider()),
      ],
      child: MaterialApp.router(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('en'), Locale('es')],
        title: 'pagamepo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppLightTheme.configureAppTheme(),
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
