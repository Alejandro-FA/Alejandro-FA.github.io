import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/content_repository.dart';

part 'content_controller.g.dart';

@riverpod
class ContentController extends _$ContentController {
  @override
  Future<String> build(String fileName) async {
    final contentRepository = ref.watch(contentRepositoryProvider);
    return contentRepository.loadContent(fileName);
  }
}
