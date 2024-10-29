import 'dart:ui';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../controllers/localization_controller.dart';

part 'content_repository.g.dart';

class ContentRepository {
  const ContentRepository({required this.locale});

  final Locale locale;

  Future<String> loadContent(String fileName) async {
    final fullPath = path.join(contentPath, fileName);
    return rootBundle.loadString(fullPath);
  }

  String get contentPath => switch (locale.languageCode) {
        'es' => 'assets/content/es',
        _ => 'assets/content/en',
      };
}

@riverpod
ContentRepository contentRepository(Ref ref) {
  final locale = ref.watch(localizationControllerProvider);
  return ContentRepository(locale: locale);
}
