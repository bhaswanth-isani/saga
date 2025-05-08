// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_book.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uploadBookHash() => r'4eec471c68a7275f507519a25a7b59aa57bf3116';

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

/// See also [uploadBook].
@ProviderFor(uploadBook)
const uploadBookProvider = UploadBookFamily();

/// See also [uploadBook].
class UploadBookFamily extends Family<AsyncValue<bool>> {
  /// See also [uploadBook].
  const UploadBookFamily();

  /// See also [uploadBook].
  UploadBookProvider call({
    required String isbn13,
    required String path,
    required void Function(int, int) progress,
  }) {
    return UploadBookProvider(isbn13: isbn13, path: path, progress: progress);
  }

  @override
  UploadBookProvider getProviderOverride(
    covariant UploadBookProvider provider,
  ) {
    return call(
      isbn13: provider.isbn13,
      path: provider.path,
      progress: provider.progress,
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
  String? get name => r'uploadBookProvider';
}

/// See also [uploadBook].
class UploadBookProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [uploadBook].
  UploadBookProvider({
    required String isbn13,
    required String path,
    required void Function(int, int) progress,
  }) : this._internal(
         (ref) => uploadBook(
           ref as UploadBookRef,
           isbn13: isbn13,
           path: path,
           progress: progress,
         ),
         from: uploadBookProvider,
         name: r'uploadBookProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$uploadBookHash,
         dependencies: UploadBookFamily._dependencies,
         allTransitiveDependencies: UploadBookFamily._allTransitiveDependencies,
         isbn13: isbn13,
         path: path,
         progress: progress,
       );

  UploadBookProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isbn13,
    required this.path,
    required this.progress,
  }) : super.internal();

  final String isbn13;
  final String path;
  final void Function(int, int) progress;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UploadBookRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadBookProvider._internal(
        (ref) => create(ref as UploadBookRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isbn13: isbn13,
        path: path,
        progress: progress,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UploadBookProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadBookProvider &&
        other.isbn13 == isbn13 &&
        other.path == path &&
        other.progress == progress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isbn13.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);
    hash = _SystemHash.combine(hash, progress.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UploadBookRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `isbn13` of this provider.
  String get isbn13;

  /// The parameter `path` of this provider.
  String get path;

  /// The parameter `progress` of this provider.
  void Function(int, int) get progress;
}

class _UploadBookProviderElement extends AutoDisposeFutureProviderElement<bool>
    with UploadBookRef {
  _UploadBookProviderElement(super.provider);

  @override
  String get isbn13 => (origin as UploadBookProvider).isbn13;
  @override
  String get path => (origin as UploadBookProvider).path;
  @override
  void Function(int, int) get progress =>
      (origin as UploadBookProvider).progress;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
