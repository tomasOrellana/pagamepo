import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oepaga/layout/index.dart';
import 'package:oepaga/router/route_names.dart';
import 'package:oepaga/theme/index.dart';

class AppWrapper extends StatelessWidget {
  final Widget body;
  const AppWrapper({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: router.location,
        isSubPage: !mainScreens.contains(router.location),
      ),
      endDrawer: const DrawerNavBar(),
      backgroundColor: ThemeColors.primary,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: ThemeColors.white,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          child: body),
      /* bottomNavigationBar:
          mainScreens.contains(router.location) ? const Navbar() : null, */
    );
  }
}
