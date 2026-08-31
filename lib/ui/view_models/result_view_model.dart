import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/data/repositories/photo_repository.dart';
import 'package:randomized_restaurant/data/repositories/restaurant_repository.dart';
import 'package:randomized_restaurant/models/photo.dart';
import 'package:randomized_restaurant/models/restaurant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_view_model.g.dart';

class RandomizerState {
  List<Restaurant> candidates;
  Restaurant? pickedRestaurant;
  bool isLoading;

  RandomizerState({
    this.candidates = const [],
    this.pickedRestaurant,
    this.isLoading = false,
  });

  RandomizerState copyWith({
    List<Restaurant>? candidates,
    Restaurant? pickedRestaurant,
    Photo? displayPhoto,
    bool? isLoading,
  }) => RandomizerState(
    candidates: candidates ?? this.candidates,
    pickedRestaurant: pickedRestaurant ?? this.pickedRestaurant,
    isLoading: isLoading ?? this.isLoading,
  );
}

@riverpod
class ResultViewModel extends _$ResultViewModel {
  @override
  RandomizerState build() {
    final candidates = ref.watch(restaurantRepositoryProvider);
    return RandomizerState(candidates: candidates);
  }

  Future<void> load({double? latitude, double? longitude}) async {
    state = state.copyWith(isLoading: true);

    await ref
        .read(restaurantRepositoryProvider.notifier)
        .fetchRestaurants(latitude: latitude ?? 0, longitude: longitude ?? 0);

    final pickedRestaurant = ref
        .read(restaurantRepositoryProvider.notifier)
        .select();

    state = state.copyWith(
      isLoading: false,
      pickedRestaurant: pickedRestaurant,
    );
  }
}

@riverpod
Future<Photo?> displayPhoto(Ref ref) async {
  final picked = ref.watch(
    resultViewModelProvider.select((state) => state.pickedRestaurant),
  );
  if (picked == null) {
    return null;
  }
  return ref.read(photoRepositoryProvider.notifier).photo(picked.photo.name);
}
