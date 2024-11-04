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
import 'package:portfolio/widgets/language_toggle_button.dart';

void main() {
  testWidgets('App bar does not overflow in neither language', (tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(840, 600);

    // Change if nothing overflows in the default language
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    // Change language and check if nothing overflows
    final languageButton = find.byType(LanguageToggleButton);
    expect(languageButton, findsOne);
    await tester.tap(languageButton);
    await tester.pumpAndSettle();
  });
}
