// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FilterRepository)
final filterRepositoryProvider = FilterRepositoryProvider._();

final class FilterRepositoryProvider
    extends $NotifierProvider<FilterRepository, Set<FoodCategory>> {
  FilterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filterRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filterRepositoryHash();

  @$internal
  @override
  FilterRepository create() => FilterRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<FoodCategory> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<FoodCategory>>(value),
    );
  }
}

String _$filterRepositoryHash() => r'71eaa54a42c1422008cbe96c1bfb7843d107a6bc';

abstract class _$FilterRepository extends $Notifier<Set<FoodCategory>> {
  Set<FoodCategory> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<FoodCategory>, Set<FoodCategory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<FoodCategory>, Set<FoodCategory>>,
              Set<FoodCategory>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
