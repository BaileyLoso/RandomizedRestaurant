// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhotoRepository)
final photoRepositoryProvider = PhotoRepositoryProvider._();

final class PhotoRepositoryProvider
    extends $NotifierProvider<PhotoRepository, Map<String, PhotoCacheEntry>> {
  PhotoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoRepositoryHash();

  @$internal
  @override
  PhotoRepository create() => PhotoRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, PhotoCacheEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, PhotoCacheEntry>>(value),
    );
  }
}

String _$photoRepositoryHash() => r'eeb358329f376f0145232e81b801c5a3fd811747';

abstract class _$PhotoRepository
    extends $Notifier<Map<String, PhotoCacheEntry>> {
  Map<String, PhotoCacheEntry> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<Map<String, PhotoCacheEntry>, Map<String, PhotoCacheEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<String, PhotoCacheEntry>,
                Map<String, PhotoCacheEntry>
              >,
              Map<String, PhotoCacheEntry>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
