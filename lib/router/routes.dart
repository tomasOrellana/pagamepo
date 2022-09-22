import 'package:go_router/go_router.dart';
import 'package:oepaga/router/route_names.dart';
import 'package:oepaga/router/transition_route.dart';
import 'package:oepaga/screens/index.dart';

final GoRouter router = GoRouter(
  initialLocation: AppPage.listItem.toPath,
  routes: <GoRoute>[
    GoRoute(
      path: AppPage.home.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const HomeScreen()),
    ),
    GoRoute(
      path: AppPage.members.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const MembersScreen()),
    ),
    GoRoute(
      path: AppPage.newItem.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const NewScreen()),
    ),
    GoRoute(
      path: AppPage.listItem.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const ListScreen()),
    ),
    GoRoute(
      path: AppPage.profile.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const ProfileScreen()),
    ),
    GoRoute(
      path: AppPage.options.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const OptionsScreen()),
    )
  ],
);
