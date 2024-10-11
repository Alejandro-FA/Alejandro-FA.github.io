import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'pages/cv.dart' deferred as cv;
import 'pages/home.dart' deferred as home;
import 'pages/projects.dart' deferred as projects;
import 'pages/research.dart' deferred as research;
import 'widgets/deferred_widget.dart';

/// Builds the router for the app.
/// Path names must match the file names in the pages folder.
GoRouter buildRouter({required Color color}) => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          name: 'Home',
          path: '/',
          pageBuilder: (context, state) => NoTransitionPage(
            child: Title(
              title: 'Home | Alejandro Fernández Alburquerque',
              color: color,
              child: DeferredWidget(
                future: home.loadLibrary(), // ignore: discarded_futures
                child: home.HomePage(),
              ),
            ),
          ),
        ),
        GoRoute(
          name: 'Research',
          path: '/research',
          pageBuilder: (context, state) => NoTransitionPage(
            child: Title(
              title: 'Research | Alejandro Fernández Alburquerque',
              color: color,
              child: DeferredWidget(
                future: research.loadLibrary(), // ignore: discarded_futures
                child: research.ResearchPage(),
              ),
            ),
          ),
        ),
        GoRoute(
          name: 'Projects',
          path: '/projects',
          pageBuilder: (context, state) => NoTransitionPage(
            child: Title(
              title: 'Projects | Alejandro Fernández Alburquerque',
              color: color,
              child: DeferredWidget(
                future: projects.loadLibrary(), // ignore: discarded_futures
                child: projects.ProjectsPage(),
              ),
            ),
          ),
        ),
        GoRoute(
          name: 'Curriculum Vitae',
          path: '/cv',
          pageBuilder: (context, state) => NoTransitionPage(
            child: Title(
              title: 'Curriculum Vitae | Alejandro Fernández Alburquerque',
              color: color,
              child: DeferredWidget(
                future: cv.loadLibrary(), // ignore: discarded_futures
                child: cv.CVPage(),
              ),
            ),
          ),
        ),
      ],
    );
