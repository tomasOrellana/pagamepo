import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oepaga/router/route_names.dart';
import 'package:oepaga/theme/index.dart';

const double appBarheight = 60;

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool isSubPage;
  final String title;
  const CustomAppBar({Key? key, required this.isSubPage, required this.title})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(appBarheight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(getAppBarTitle(title)),
      leading: isSubPage
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => {context.pop()},
            )
          : null,
      backgroundColor: ThemeColors.primary,
      elevation: 0,
      leadingWidth: 80,
      centerTitle: true,
    );
  }
}
