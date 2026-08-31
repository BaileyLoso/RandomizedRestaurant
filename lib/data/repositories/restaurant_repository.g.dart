// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RestaurantRepository)
final restaurantRepositoryProvider = RestaurantRepositoryProvider._();

final class RestaurantRepositoryProvider
    extends $NotifierProvider<RestaurantRepository, List<Restaurant>> {
  RestaurantRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'restaurantRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$restaurantRepositoryHash();

  @$internal
  @override
  RestaurantRepository create() => RestaurantRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Restaurant> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Restaurant>>(value),
    );
  }
}

String _$restaurantRepositoryHash() =>
    r'0da084e71c2effdcaf849020f78dc5b27a4c469b';

abstract class _$RestaurantRepository extends $Notifier<List<Restaurant>> {
  List<Restaurant> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Restaurant>, List<Restaurant>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Restaurant>, List<Restaurant>>,
              List<Restaurant>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
