import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web/web.dart' as web;

import '../repositories/file_repository.dart';

part 'storage_service.g.dart';

class StorageService {
  const StorageService({required this.fileRepository});

  final FileRepository fileRepository;

  Future<void> download(String fileName) async {
    final uri = await fileRepository.getUri(fileName);

    web.document.createElement('a') as web.HTMLAnchorElement
      ..href = uri.toString()
      ..download = path.basename(uri.path)
      ..click()
      ..remove();
  }
}

@riverpod
StorageService storageService(Ref ref) => StorageService(
      fileRepository: ref.watch(fileRepositoryProvider),
    );
