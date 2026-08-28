import 'package:randomized_restaurant/data/services/api/api_client.dart';
import 'package:randomized_restaurant/models/restaurant.dart';

class RestaurantRepository {
  List<Restaurant> restaurants = [];
  Restaurant? selectedRestaurant;
  int _index = 0;
  final ApiClient _client = ApiClient();

  RestaurantRepository();

  // TODO fetch from *random* sections of a map
  Future<List<Restaurant>>? fetchRestaurants({
    int radius = 5000,
    required double latitude,
    required double longitude,
    int resultsCount = 20,
  }) async {
    if (restaurants.isNotEmpty) {
      restaurants.clear();
    }
    var r = await _client.fetchNearbyRestaurants(
      radius: radius,
      latitude: latitude,
      longitude: longitude,
      pageSize: 20,
    );
    restaurants.addAll(r.map((restaurant) => restaurant).toList());
    if (restaurants.isNotEmpty) {
      restaurants.shuffle();
    }
    return restaurants;
  }

  /// Selects a restaurant from the list of current restaurants
  Restaurant? select() {
    if (restaurants.isNotEmpty) {
      if (_index >= restaurants.length) {
        _index = 0;
      }
      selectedRestaurant = restaurants[_index];
      return selectedRestaurant;
    }
    return null;
  }
}
