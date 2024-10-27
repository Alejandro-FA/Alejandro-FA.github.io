import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(deferredLoading: true)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(); // No transitions

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CVRoute.page,
          path: '/cv',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: ProjectsRoute.page,
          path: '/projects',
        ),
        AutoRoute(
          page: ResearchRoute.page,
          path: '/research',
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => []; // optionally add root guards here
}
