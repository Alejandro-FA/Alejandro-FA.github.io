import 'dart:async';

import 'package:auto_route/auto_route.dart';

import '../controllers/content_controller.dart';

class CacheGuard extends AutoRouteGuard {
  const CacheGuard({required this.cacheController, this.files = const []});

  final ContentController cacheController;
  final List<String> files;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    await Future.wait(
      files.map(cacheController.loadIfAbsent),
      eagerError: true,
    );
    resolver.next(true);
  }
}
