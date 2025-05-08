// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_stat.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$setStatHash() => r'2b04135ed222d10930458d636c8d6c2d5d0ddc62';

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

/// See also [setStat].
@ProviderFor(setStat)
const setStatProvider = SetStatFamily();

/// See also [setStat].
class SetStatFamily extends Family<AsyncValue<void>> {
  /// See also [setStat].
  const SetStatFamily();

  /// See also [setStat].
  SetStatProvider call({required String isbn13, required double progress}) {
    return SetStatProvider(isbn13: isbn13, progress: progress);
  }

  @override
  SetStatProvider getProviderOverride(covariant SetStatProvider provider) {
    return call(isbn13: provider.isbn13, progress: provider.progress);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'setStatProvider';
}

/// See also [setStat].
class SetStatProvider extends AutoDisposeFutureProvider<void> {
  /// See also [setStat].
  SetStatProvider({required String isbn13, required double progress})
    : this._internal(
        (ref) => setStat(ref as SetStatRef, isbn13: isbn13, progress: progress),
        from: setStatProvider,
        name: r'setStatProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$setStatHash,
        dependencies: SetStatFamily._dependencies,
        allTransitiveDependencies: SetStatFamily._allTransitiveDependencies,
        isbn13: isbn13,
        progress: progress,
      );

  SetStatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isbn13,
    required this.progress,
  }) : super.internal();

  final String isbn13;
  final double progress;

  @override
  Override overrideWith(FutureOr<void> Function(SetStatRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SetStatProvider._internal(
        (ref) => create(ref as SetStatRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isbn13: isbn13,
        progress: progress,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SetStatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetStatProvider &&
        other.isbn13 == isbn13 &&
        other.progress == progress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isbn13.hashCode);
    hash = _SystemHash.combine(hash, progress.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SetStatRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `isbn13` of this provider.
  String get isbn13;

  /// The parameter `progress` of this provider.
  double get progress;
}

class _SetStatProviderElement extends AutoDisposeFutureProviderElement<void>
    with SetStatRef {
  _SetStatProviderElement(super.provider);

  @override
  String get isbn13 => (origin as SetStatProvider).isbn13;
  @override
  double get progress => (origin as SetStatProvider).progress;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
