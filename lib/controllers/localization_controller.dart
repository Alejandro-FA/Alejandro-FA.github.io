import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization_controller.g.dart';

@riverpod
class LocalizationController extends _$LocalizationController {
  static const locales = [
    Locale('en'),
    Locale('es'),
  ];

  @override
  // Consider returning null to use the system locale by default
  Locale build() => locales[0];

  void toggleLocale() => state = state == locales[0] ? locales[1] : locales[0];
}
