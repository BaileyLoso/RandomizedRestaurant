import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:randomized_restaurant/data/services/api/api_client.dart';
import 'package:randomized_restaurant/env.dart';
import 'package:randomized_restaurant/models/restaurant.dart';

import '../fixtures/test_restaurants.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ApiClient client;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    client = ApiClient(dio: dio);
  });

  test('Client parses restaurants from a successful response', () async {
    dioAdapter.onPost(
      Env.textSearchUrl,
      (server) => server.reply(200, {
        'places': [restaurantOne, restaurantTwo, restaurantThree],
      }),
      data: Matchers.any,
    );

    final List<Restaurant> result = await client.fetchRestaurantsText(
      radius: 1000,
      latitude: 45.02608885433202,
      longitude: -93.19208827866116,
      pageSize: 5,
    );

    expect(result.length, 3);
    expect(result.map((r) => r.name), [
      'Spoon and Stable',
      'Maison Margaux',
      'La Casitas',
    ]);
  });

  test('Client returns an empty list on API error', () async {
    dioAdapter.onPost(
      Env.textSearchUrl,
      (server) => server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: Env.textSearchUrl),
          response: Response(
            requestOptions: RequestOptions(path: Env.textSearchUrl),
            statusCode: 500,
          ),
        ),
      ),
      data: Matchers.any,
    );

    final List<Restaurant> result = await client.fetchRestaurantsText(
      radius: 1000,
      latitude: 45.02608885433202,
      longitude: -93.19208827866116,
      pageSize: 5,
    );

    expect(result, isEmpty);
  });
}
