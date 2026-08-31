import 'package:randomized_restaurant/data/services/api/api_client.dart';
import 'package:randomized_restaurant/models/restaurant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'restaurant_repository.g.dart';

@riverpod
class RestaurantRepository extends _$RestaurantRepository {
  int _index = 0;
  final ApiClient _client = ApiClient();

  @override
  List<Restaurant> build() {
    return [];
  }

  RestaurantRepository();

  Future<void> fetchRestaurants({
    int radius = 5000,
    required double latitude,
    required double longitude,
    int pageSize = 20,
  }) async {
    var r = await _client.fetchNearbyRestaurants(
      radius: radius,
      latitude: latitude,
      longitude: longitude,
      pageSize: 20,
    );
    r.shuffle();
    _index = 0;
  }

  /// Selects a restaurant from the list of current restaurants
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
}
