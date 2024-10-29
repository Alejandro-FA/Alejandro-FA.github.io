// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

@TestOn('browser')
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/main.dart';
import 'package:portfolio/navigation/router.dart';

void main() {
  testWidgets('App bar adapts based on screen width', (tester) async {
    tester.view.devicePixelRatio = 1.0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(child: MyApp(router: AppRouter())),
    );
    await tester.pumpAndSettle();

    // Test actions visibility when screen width is greater than the breakpoint
    tester.view.physicalSize = const Size(840, 600);
    await tester.pump();
    expect(find.byIcon(Icons.menu), findsNothing);

    // Test actions visibility when screen width is less than the breakpoint
    tester.view.physicalSize = const Size(839, 600);
    await tester.pump();
    expect(find.byIcon(Icons.menu), findsOneWidget);
  });
}
