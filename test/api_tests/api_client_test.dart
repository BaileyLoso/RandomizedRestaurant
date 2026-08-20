import 'package:flutter_test/flutter_test.dart';

import 'package:randomized_restaurant/data/services/api/api_client.dart';
import 'package:randomized_restaurant/models/restaurant.dart';

void main() {
  test('Client can request API data', () async {
    final client = ApiClient();
    List<Restaurant> r = await client.fetchNearbyRestaurants(
      1000,
      45.02608885433202,
      -93.19208827866116,
      5,
    );

    expect(r, isNotEmpty);
    expect(
      [r[0].name, r[1].name, r[2].name, r[3].name, r[4].name],
      [
        'Panda Express',
        'India Palace',
        'Denny\'s Restaurant',
        'Burger King',
        'New Hong Kong Wok',
      ],
    );
  });
}
