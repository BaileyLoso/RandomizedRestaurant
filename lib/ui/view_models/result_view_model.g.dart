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
        isAutoDispose: false,
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

String _$resultViewModelHash() => r'ee34ae8e098be4212aa7663f20d114b28e79991d';

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

@ProviderFor(ResultPhotoViewModel)
final resultPhotoViewModelProvider = ResultPhotoViewModelProvider._();

final class ResultPhotoViewModelProvider
    extends $NotifierProvider<ResultPhotoViewModel, Photo?> {
  ResultPhotoViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resultPhotoViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resultPhotoViewModelHash();

  @$internal
  @override
  ResultPhotoViewModel create() => ResultPhotoViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Photo? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Photo?>(value),
    );
  }
}

String _$resultPhotoViewModelHash() =>
    r'608812c511bb3642b3921d6d186537ff26a6e1dc';

abstract class _$ResultPhotoViewModel extends $Notifier<Photo?> {
  Photo? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Photo?, Photo?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Photo?, Photo?>,
              Photo?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
