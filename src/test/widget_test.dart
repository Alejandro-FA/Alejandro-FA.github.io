// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/widgets/app_bar.dart';

void main() {
  testWidgets('ResponsiveAppBar adapts based on screen width', (WidgetTester tester) async {
    // Define the screen width thresholds for the test
    const double wideScreenBreakpoint = 840.0;
    tester.view.devicePixelRatio = 1.0;
    final appTitle = 'My app with a long title';

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              ResponsiveAppBar(
                title: appTitle,
                menus: ['Page 1', 'Page 2', 'Page 3'],
                wideScreenBreakpoint: wideScreenBreakpoint,
              ),
            ],
          ),
        ),
      ),
    );

    // Test actions visibility when screen width is greater than the breakpoint
    tester.view.physicalSize = const Size(1200, 800); // width, height
    await tester.pump();
    expect(find.byType(TextButton), findsNWidgets(3)); // Should show 3 buttons
    expect(find.byIcon(Icons.menu), findsNothing); // No menu icon
    expect(find.text(appTitle), findsOneWidget); // Should show title

    // Test actions visibility when screen width is less than the breakpoint
    tester.view.physicalSize = const Size(600, 800); // width, height
    await tester.pump();
    expect(find.byType(TextButton), findsNothing); // No action buttons
    expect(find.byIcon(Icons.menu), findsOneWidget); // Should show menu icon

    // Test title visibility when the screen width is very small
    tester.view.physicalSize = const Size(200, 800); // width, height
    await tester.pump();
    expect(find.text(appTitle), findsNothing); // No title
  });
}
