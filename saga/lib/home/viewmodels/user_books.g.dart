// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_books.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchLibraryHash() => r'12d7df353daba6d973536d23b4c5f06f9aae0963';

/// See also [fetchLibrary].
@ProviderFor(fetchLibrary)
final fetchLibraryProvider =
    AutoDisposeFutureProvider<List<UserBookDetails>>.internal(
      fetchLibrary,
      name: r'fetchLibraryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$fetchLibraryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchLibraryRef = AutoDisposeFutureProviderRef<List<UserBookDetails>>;
String _$libraryHash() => r'ce36d386d437a8aaf2c6e933159d8622fd1840e3';

/// See also [library].
@ProviderFor(library)
final libraryProvider = StreamProvider<List<UserBookDetails>>.internal(
  library,
  name: r'libraryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$libraryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LibraryRef = StreamProviderRef<List<UserBookDetails>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
