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
      path: AppPage.newItem.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const NewScreen()),
    ),
    GoRoute(
        path: AppPage.listItem.toPath,
        pageBuilder: (context, state) =>
            transitionBuilder(state, const ListScreen()),
        routes: [
          GoRoute(
              path: 'billing/:id/resume',
              pageBuilder: (context, state) {
                final String id = state.params['id']!;
                return transitionBuilder(state, ResumeBillingScreen(id: id));
              }),
          GoRoute(
            path: 'billing/:id',
            pageBuilder: (context, state) {
              final String id = state.params['id']!;
              return transitionBuilder(state, ListBillingScreen(id: id));
            },
          ),
          GoRoute(
            path: 'billing/:id/new',
            pageBuilder: (context, state) {
              final String id = state.params['id']!;
              return transitionBuilder(state, NewBillingScreen(id: id));
            },
          ),
        ]),
    GoRoute(
      path: AppPage.profile.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const ProfileScreen()),
    ),
    GoRoute(
      path: AppPage.options.toPath,
      pageBuilder: (context, state) =>
          transitionBuilder(state, const OptionsScreen()),
    ),
  ],
);
