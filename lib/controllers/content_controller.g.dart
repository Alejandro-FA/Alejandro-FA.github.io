// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contentControllerHash() => r'fdca74d2419f1753208f50f789f6f154519163ce';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ContentController
    extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final String fileName;

  FutureOr<String> build(
    String fileName,
  );
}

/// See also [ContentController].
@ProviderFor(ContentController)
const contentControllerProvider = ContentControllerFamily();

/// See also [ContentController].
class ContentControllerFamily extends Family<AsyncValue<String>> {
  /// See also [ContentController].
  const ContentControllerFamily();

  /// See also [ContentController].
  ContentControllerProvider call(
    String fileName,
  ) {
    return ContentControllerProvider(
      fileName,
    );
  }

  @override
  ContentControllerProvider getProviderOverride(
    covariant ContentControllerProvider provider,
  ) {
    return call(
      provider.fileName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'contentControllerProvider';
}

/// See also [ContentController].
class ContentControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ContentController, String> {
  /// See also [ContentController].
  ContentControllerProvider(
    String fileName,
  ) : this._internal(
          () => ContentController()..fileName = fileName,
          from: contentControllerProvider,
          name: r'contentControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contentControllerHash,
          dependencies: ContentControllerFamily._dependencies,
          allTransitiveDependencies:
              ContentControllerFamily._allTransitiveDependencies,
          fileName: fileName,
        );

  ContentControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileName,
  }) : super.internal();

  final String fileName;

  @override
  FutureOr<String> runNotifierBuild(
    covariant ContentController notifier,
  ) {
    return notifier.build(
      fileName,
    );
  }

  @override
  Override overrideWith(ContentController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContentControllerProvider._internal(
        () => create()..fileName = fileName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileName: fileName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ContentController, String>
      createElement() {
    return _ContentControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContentControllerProvider && other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContentControllerRef on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `fileName` of this provider.
  String get fileName;
}

class _ContentControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ContentController, String>
    with ContentControllerRef {
  _ContentControllerProviderElement(super.provider);

  @override
  String get fileName => (origin as ContentControllerProvider).fileName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
