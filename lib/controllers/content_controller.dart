import 'dart:collection';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/content_repository.dart';

part 'content_controller.g.dart';

/// A controller for managing a cache of content, identified by file names.
@riverpod
class ContentController extends _$ContentController {
  @override
  HashMap<String, String> build() {
    // Reset state when the repository changes
    ref.watch(contentRepositoryProvider);
    return HashMap<String, String>();
  }

  /// Loads content to the cache for the given [fileName].
  ///
  /// Loads the content from the repository and updates the state.
  /// Returns the loaded content for convenience.
  Future<String> load(String fileName) async {
    final contentRepository = ref.read(contentRepositoryProvider);
    final content = await contentRepository.loadContent(fileName);
    state = state.copyWith({fileName: content});
    return content;
  }

  /// Loads content to the cache for the given [fileName]
  /// (if it is not already present).
  ///
  /// If the content is already present, returns the existing content.
  /// Otherwise, loads the content from the repository, updates the state,
  /// and returns the loaded content.
  Future<String> loadIfAbsent(String fileName) async {
    if (!state.containsKey(fileName)) return load(fileName);
    return state[fileName]!;
  }

  /// Removes the content associated with the given [fileName] from the cache.
  Future<void> remove(String fileName) async {
    state = state.copyWithout([fileName]);
  }

  /// Clears all content from the cache.
  Future<void> clear() async {
    state = HashMap<String, String>();
  }
}

extension on HashMap<String, String> {
  /// Returns a new [HashMap] with the entries from [other] added to this map.
  HashMap<String, String> copyWith(Map<String, String> other) =>
      HashMap<String, String>.of(this)..addAll(other);

  /// Returns a new [HashMap] with the entries whose keys are not in [keys]
  /// removed from this map.
  HashMap<String, String> copyWithout(Iterable<String> keys) =>
      HashMap<String, String>.of(this)
        ..removeWhere((key, value) => keys.contains(key));
}
