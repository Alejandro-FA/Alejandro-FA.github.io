// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:portfolio/pages/cv.dart' deferred as _i1;
import 'package:portfolio/pages/home.dart' deferred as _i2;
import 'package:portfolio/pages/projects.dart' deferred as _i3;
import 'package:portfolio/pages/research.dart' deferred as _i4;

/// generated route for
/// [_i1.CVPage]
class CVRoute extends _i5.PageRouteInfo<void> {
  const CVRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CVRoute.name,
          initialChildren: children,
        );

  static const String name = 'CVRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.CVPage(),
      );
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i2.loadLibrary,
        () => _i2.HomePage(),
      );
    },
  );
}

/// generated route for
/// [_i3.ProjectsPage]
class ProjectsRoute extends _i5.PageRouteInfo<void> {
  const ProjectsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProjectsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i3.loadLibrary,
        () => _i3.ProjectsPage(),
      );
    },
  );
}

/// generated route for
/// [_i4.ResearchPage]
class ResearchRoute extends _i5.PageRouteInfo<void> {
  const ResearchRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ResearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResearchRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i4.loadLibrary,
        () => _i4.ResearchPage(),
      );
    },
  );
}
