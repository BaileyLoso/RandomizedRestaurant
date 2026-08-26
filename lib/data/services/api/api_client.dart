import 'package:dio/dio.dart';
import 'package:randomized_restaurant/env.dart';
import 'package:randomized_restaurant/models/restaurant.dart';
import 'package:randomized_restaurant/models/photo.dart';

// TODO: API Error handling
class ApiClient {
  final Dio _client = Dio(BaseOptions(connectTimeout: Duration(seconds: 10)));

  ApiClient();

  Future<List<Restaurant>> fetchNearbyRestaurants(
    double radius,
    double lat,
    double long,
    int resultsCount,
  ) async {
    try {
      final response = await _client.postUri(
        Uri.parse(Env.restaurantsUrl),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-FieldMask': 'places.id,places.displayName,places.types,places.formattedAddress',
            'X-Goog-Api-Key': Env.apiKey,
          },
        ),
        data: {
          'includedTypes': ['restaurant'],
          'maxResultCount': resultsCount,
          'locationRestriction': {
            'circle': {
              'center': {'latitude': lat, 'longitude': long},
              'radius': radius,
            },
          },
        },
      );
      final result = response.data['places'] as List;
      return result.map((json) => Restaurant.fromPlacesApiJson(json)).toList();
    } catch (err) {
      print('API error: $err');
      return [];
    }
  }

  // TODO Replace default maximum values with a more precise value.
  Future<Photo?> fetchPhoto(String name) async {
    try {
      final response = await _client.get(
        '{Env.baseUrl}$name/media',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {'key': Env.apiKey, 'maxWidthPx': '8000', 'maxHeightPx': '8000'},
      );
      return Photo.fromPhotoJson(response as Map<String, String>);
    } catch (err) {
      print('API error: $err');
      return null;
    }
  }
}
