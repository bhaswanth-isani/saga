// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_book.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getBookDetailsHash() => r'f5102f3fa27ff07f473f53f14a0d9cd163eb5c33';

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

/// See also [getBookDetails].
@ProviderFor(getBookDetails)
const getBookDetailsProvider = GetBookDetailsFamily();

/// See also [getBookDetails].
class GetBookDetailsFamily extends Family<AsyncValue<UserBookDetails?>> {
  /// See also [getBookDetails].
  const GetBookDetailsFamily();

  /// See also [getBookDetails].
  GetBookDetailsProvider call(String isbn13) {
    return GetBookDetailsProvider(isbn13);
  }

  @override
  GetBookDetailsProvider getProviderOverride(
    covariant GetBookDetailsProvider provider,
  ) {
    return call(provider.isbn13);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getBookDetailsProvider';
}

/// See also [getBookDetails].
class GetBookDetailsProvider
    extends AutoDisposeStreamProvider<UserBookDetails?> {
  /// See also [getBookDetails].
  GetBookDetailsProvider(String isbn13)
    : this._internal(
        (ref) => getBookDetails(ref as GetBookDetailsRef, isbn13),
        from: getBookDetailsProvider,
        name: r'getBookDetailsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getBookDetailsHash,
        dependencies: GetBookDetailsFamily._dependencies,
        allTransitiveDependencies:
            GetBookDetailsFamily._allTransitiveDependencies,
        isbn13: isbn13,
      );

  GetBookDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isbn13,
  }) : super.internal();

  final String isbn13;

  @override
  Override overrideWith(
    Stream<UserBookDetails?> Function(GetBookDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBookDetailsProvider._internal(
        (ref) => create(ref as GetBookDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isbn13: isbn13,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<UserBookDetails?> createElement() {
    return _GetBookDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBookDetailsProvider && other.isbn13 == isbn13;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isbn13.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetBookDetailsRef on AutoDisposeStreamProviderRef<UserBookDetails?> {
  /// The parameter `isbn13` of this provider.
  String get isbn13;
}

class _GetBookDetailsProviderElement
    extends AutoDisposeStreamProviderElement<UserBookDetails?>
    with GetBookDetailsRef {
  _GetBookDetailsProviderElement(super.provider);

  @override
  String get isbn13 => (origin as GetBookDetailsProvider).isbn13;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
