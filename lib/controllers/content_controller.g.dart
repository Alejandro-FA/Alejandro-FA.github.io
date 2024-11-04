// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contentControllerHash() => r'1e439cc0098ba83ef19c31db267911d15c8adac6';

/// A controller for managing a cache of content, identified by file names.
///
/// Copied from [ContentController].
@ProviderFor(ContentController)
final contentControllerProvider = AutoDisposeNotifierProvider<ContentController,
    HashMap<String, String>>.internal(
  ContentController.new,
  name: r'contentControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$contentControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ContentController = AutoDisposeNotifier<HashMap<String, String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
