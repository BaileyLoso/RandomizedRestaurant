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
    bool? isLoading,
  }) => RandomizerState(
    candidates: candidates ?? this.candidates,
    pickedRestaurant: pickedRestaurant ?? this.pickedRestaurant,
    isLoading: isLoading ?? this.isLoading,
  );
}

@Riverpod(keepAlive: true)
class ResultViewModel extends _$ResultViewModel {
  @override
  RandomizerState build() {
    final candidates = ref.watch(restaurantRepositoryProvider);
    return RandomizerState(candidates: candidates);
  }

  Future<void> load({double? latitude, double? longitude}) async {
    state = state.copyWith(isLoading: true);
    Restaurant? pickedRestaurant;
    if (state.candidates.isNotEmpty) {
      pickedRestaurant = ref
          .read(restaurantRepositoryProvider.notifier)
          .select();
    } else {
      await ref
          .read(restaurantRepositoryProvider.notifier)
          .fetchRestaurants(latitude: latitude ?? 0, longitude: longitude ?? 0);

      if (!ref.mounted) {
        return;
      }
      pickedRestaurant = ref
          .read(restaurantRepositoryProvider.notifier)
          .select();
    }

    state = state.copyWith(
      isLoading: false,
      pickedRestaurant: pickedRestaurant,
    );
  }

  void nextRestaurant() {
    final pickedRestaurant = ref
        .read(restaurantRepositoryProvider.notifier)
        .select();
    state = state.copyWith(pickedRestaurant: pickedRestaurant);
  }

  void previousRestaurant() {
    final pickedRestaurant = ref
        .read(restaurantRepositoryProvider.notifier)
        .previous();
    state = state.copyWith(pickedRestaurant: pickedRestaurant);
  }
}

@riverpod
class ResultPhotoViewModel extends _$ResultPhotoViewModel {
  @override
  Photo? build() => Photo(name: '', uri: '');

  Future<Photo?> mainPhoto() async {
    final picked = ref.watch(
      resultViewModelProvider.select((state) => state.pickedRestaurant),
    ); // Gets the picked restaurant
    if (picked == null) {
      return null;
    }
    return await ref
        .read(photoRepositoryProvider.notifier)
        .photo(
          picked.photo.name,
        ); // Get photo from photo repository with the same name
  }
}
