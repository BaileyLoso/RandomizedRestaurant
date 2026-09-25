import 'package:sweep_steaks/data/services/api/api_client.dart';
import 'package:sweep_steaks/models/categories.dart';
import 'package:sweep_steaks/models/restaurant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'restaurant_repository.g.dart';

@Riverpod(keepAlive: true)
class RestaurantRepository extends _$RestaurantRepository {
  int _index = 0;
  final ApiClient _client = ApiClient();

  @override
  List<Restaurant> build() {
    return [];
  }

  RestaurantRepository();

  Future<void> fetchRestaurantsNearby({
    int radius = 5000,
    required double latitude,
    required double longitude,
    required Set<FoodCategory> types,
  }) async {
    var r = await _client.fetchRestaurantsNearby(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
      types: types,
    );

    if (!ref.mounted) {
      return;
    }
    r.shuffle();
    state = r;
    _index = 0;
  }

  /// Fetches a list of restaurants from a provided
  Future<void> fetchRestaurantsText({
    int radius = 5000,
    required double latitude,
    required double longitude,
    FoodCategory? restaurantType,
  }) async {
    var r = await _client.fetchRestaurantsText(
      latitude: latitude,
      longitude: longitude,
      type: restaurantType,
      radius: radius,
    );
    if (!ref.mounted) {
      return;
    }
    r.shuffle();
    state = r;
    _index = 0;
  }

  /// Selects a restaurant from the list of current restaurants.
  Restaurant? select() {
    if (state.isEmpty) {
      return null;
    }
    if (_index >= state.length) {
      _index = 0;
    }
    return state[_index++];
  }

  @override
  String toString() {
    return state.toString();
  }

  /// Returns the previous item in the list of restaurants.
  Restaurant? previous() {
    if (state.isEmpty) {
      return null;
    }
    if (_index <= 0) {
      _index = state.length - 1;
    }
    return state[_index--];
  }
}
