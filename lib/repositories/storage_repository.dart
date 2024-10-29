import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repository.g.dart';

abstract interface class StorageRepository {
  Future<Uri> getUri(String fileName);
}

class _R2CloudRepository implements StorageRepository {
  _R2CloudRepository();

  final _client = http.Client();

  @override
  Future<Uri> getUri(String fileName) async {
    final uri = Uri.parse('/r2/$fileName');
    if (!await isAvailable(uri)) throw Exception('File $fileName not found');
    return uri;
  }

  Future<bool> isAvailable(Uri uri) async {
    final response = await _client.head(uri);
    return response.statusCode == 200;
  }

  void dispose() => _client.close();
}

@riverpod
StorageRepository storageRepository(Ref ref) {
  final repository = _R2CloudRepository();
  ref.onDispose(repository.dispose);
  return repository;
}
