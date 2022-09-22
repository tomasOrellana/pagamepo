import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oepaga/layout/drawer/drawer_names.dart';
import 'package:oepaga/theme/index.dart';

class DrawerNavBar extends StatelessWidget {
  const DrawerNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: 160,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 220,
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: ThemeColors.white,
                radius: 10,
                child:
                    Text('U', style: ThemeTexts.bold18(c: ThemeColors.primary)),
              ),
              accountName: const Text('Nombre persona'),
              accountEmail: const Text('correo@asd.cl'),
              decoration: const BoxDecoration(color: ThemeColors.primary),
            ),
          ),
          ...items.map((item) => ListTile(
              leading: Icon(item['icon'], color: ThemeColors.primary),
              title: Text(item['text']),
              onTap: () {
                context.go(item['route']);
              })),
          Align(
            child: ListTile(
                leading:
                    const Icon(Icons.logout_sharp, color: ThemeColors.primary),
                title: const Text('salir'),
                onTap: () {}),
          )
        ],
      ),
    );
  }
}
