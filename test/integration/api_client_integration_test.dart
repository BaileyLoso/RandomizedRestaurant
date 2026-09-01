import 'package:flutter_test/flutter_test.dart';

import 'package:randomized_restaurant/data/services/api/api_client.dart';
import 'package:randomized_restaurant/models/restaurant.dart';

void main() {
  test('Client can request basic API data', () async {
    final client = ApiClient();
    List<Restaurant> r = await client.fetchNearbyRestaurants(
      radius: 1000,
      latitude: 45.02608885433202,
      longitude: -93.19208827866116,
      pageSize: 5,
    );

    expect(r, isNotEmpty);
    expect(r.length, 10);
    expect(
      r.map((restaurant) => restaurant.name),
      containsAll([
        'Panda Express',
        'India Palace',
        'Denny\'s Restaurant',
        'Burger King',
        'New Hong Kong Wok',
      ]),
    );
  });
}
