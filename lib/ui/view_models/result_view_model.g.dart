// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ResultViewModel)
final resultViewModelProvider = ResultViewModelProvider._();

final class ResultViewModelProvider
    extends $NotifierProvider<ResultViewModel, RandomizerState> {
  ResultViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resultViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resultViewModelHash();

  @$internal
  @override
  ResultViewModel create() => ResultViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RandomizerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RandomizerState>(value),
    );
  }
}

String _$resultViewModelHash() => r'dbadc4fd8446fa7a901b09640e1535ede73518f1';

abstract class _$ResultViewModel extends $Notifier<RandomizerState> {
  RandomizerState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RandomizerState, RandomizerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RandomizerState, RandomizerState>,
              RandomizerState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(displayPhoto)
final displayPhotoProvider = DisplayPhotoProvider._();

final class DisplayPhotoProvider
    extends $FunctionalProvider<AsyncValue<Photo?>, Photo?, FutureOr<Photo?>>
    with $FutureModifier<Photo?>, $FutureProvider<Photo?> {
  DisplayPhotoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'displayPhotoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$displayPhotoHash();

  @$internal
  @override
  $FutureProviderElement<Photo?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Photo?> create(Ref ref) {
    return displayPhoto(ref);
  }
}

String _$displayPhotoHash() => r'3971ea43a332aa0e1cc15f822569c7001bf9fa5f';
