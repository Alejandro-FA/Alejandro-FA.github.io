import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repository.g.dart';

abstract interface class StorageRepository {
  Future<Uri> getUri(String fileName);
}

class _R2CloudRepository implements StorageRepository {
  _R2CloudRepository();

  @override
  Future<Uri> getUri(String fileName) async => Uri.parse('/r2/$fileName');
}

@riverpod
StorageRepository storageRepository(Ref ref) {
  final repository = _R2CloudRepository();
  return repository;
}
