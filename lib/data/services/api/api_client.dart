import 'package:dio/dio.dart';
import 'package:randomized_restaurant/env.dart';
import 'package:randomized_restaurant/models/restaurant.dart';

class ApiClient {
  final Dio _client = Dio(BaseOptions(connectTimeout: Duration(seconds: 10)));

  ApiClient();

  Future<List<Restaurant>> fetchNearbyRestaurants(
    double radius,
    double lat,
    double long,
    int resultsCount,
  ) async {
    final response = await _client.postUri(
      Uri.parse('$Env.baseUrl/data'),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-Goog-FieldMask':
              'places.displayName,places.types,places.formattedAddress',
          'X-Goog-Api-Key': Env.apiKey,
        },
      ),
      data: {
        'includedTypes': ['restaurant'],
        'maxResultCount': resultsCount,
        'locationRestriction': {
          'circle': {
            'center': {'latitude': lat, 'longitude': long},
          },
          'radius': radius,
        },
      },
    );
    final result = response.data['places'] as List;
    return result.map((json) => Restaurant.fromPlacesApiJson(json)).toList();
  }
}
