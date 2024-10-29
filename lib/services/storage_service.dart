import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web/web.dart' as web;

import '../controllers/localization_controller.dart';
import '../repositories/storage_repository.dart';

part 'storage_service.g.dart';

class StorageService {
  const StorageService({required this.repository, required this.locale});

  final StorageRepository repository;
  final Locale locale;

  Future<void> downloadCV() async {
    final uri = await repository.getUri(cvFile);

    web.document.createElement('a') as web.HTMLAnchorElement
      ..href = uri.toString()
      ..download = path.basename(uri.path)
      ..click()
      ..remove();
  }

  String get cvFile => switch (locale.languageCode) {
        'es' => 'alejandro_fernandez_cv-en.pdf',
        _ => 'alejandro_fernandez_cv-en.pdf',
      };
}

@riverpod
StorageService storageService(Ref ref) => StorageService(
      repository: ref.watch(storageRepositoryProvider),
      locale: ref.watch(localizationControllerProvider),
    );
