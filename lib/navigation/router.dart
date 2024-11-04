import 'package:auto_route/auto_route.dart';

import '../controllers/content_controller.dart';
import '../data/cv_data.dart';
import '../data/research_data.dart';
import 'route_guards.dart';
import 'router.gr.dart';

@AutoRouterConfig(deferredLoading: true)
class AppRouter extends RootStackRouter {
  AppRouter({required this.cacheController});

  final ContentController cacheController;

  @override
  RouteType get defaultRouteType => const RouteType.custom(); // No transitions

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CVRoute.page,
          path: '/cv',
          guards: [
            CacheGuard(
              cacheController: cacheController,
              files: [
                ...educationEntries.map((entry) => entry.descriptionPath),
                ...experienceEntries.map((entry) => entry.descriptionPath),
              ],
            ),
          ],
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
          guards: [
            CacheGuard(
              cacheController: cacheController,
              files: researchFiles,
            ),
          ],
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => []; // optionally add root guards here
}
