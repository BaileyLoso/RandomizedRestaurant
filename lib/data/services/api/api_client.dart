import 'package:dio/dio.dart';
import 'package:randomized_restaurant/env.dart';
import 'package:randomized_restaurant/models/restaurant.dart';
import 'package:randomized_restaurant/models/photo.dart';

// TODO: API Error handling
class ApiClient {
  final Dio _client;

  ApiClient({Dio? dio})
    : _client = dio ?? Dio(BaseOptions(connectTimeout: Duration(seconds: 10)));

  Future<List<Restaurant>> fetchNearbyRestaurants({
    required int radius,
    double latitude = 0.0,
    double longitude = 0.0,
    int pageSize = 20,
  }) async {
    try {
      final response = await _client.postUri(
        Uri.parse(Env.restaurantsUrl),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-FieldMask': 'nextPageToken, places.id,places.displayName,places.types,places.formattedAddress',
            'X-Goog-Api-Key': Env.apiKey,
          },
        ),
        data: {
          'textQuery': 'restaurant',
          'includedType': 'restaurant',
          'pageSize': pageSize,
          'openNow': true,
          'rankPreference': 'DISTANCE',
          'strictTypeFiltering': true,
          'locationRestriction': {
            'circle': {
              'center': {'latitude': latitude, 'longitude': longitude},
              'radius': radius,
            },
          },
        },
      );

      var res = response.data['places'] as List;
      var list = res.map((json) => Restaurant.fromPlacesApiJson(json)).toList();
      var pageToken = response.data['nextPageToken'] as String? ?? '';
      if (pageToken != '') {
        list.addAll(
          await _fetchNextRestaurants(
            radius: radius,
            latitude: latitude,
            longitude: longitude,
            pageSize: pageSize,
            pageToken: pageToken,
          ),
        );
      }
      return list;
    } catch (err) {
      print('API error: $err');
      return [];
    }
  }

  Future<List<Restaurant>> _fetchNextRestaurants({
    required int radius,
    required double latitude,
    required double longitude,
    required int pageSize,
    required String pageToken,
  }) async {
    try {
      final response = await _client.postUri(
        Uri.parse(Env.restaurantsUrl),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-FieldMask': 'nextPageToken, places.id,places.displayName,places.types,places.formattedAddress',
            'X-Goog-Api-Key': Env.apiKey,
            'pageToken': pageToken,
          },
        ),
        data: {
          'textQuery': 'restaurant',
          'includedType': 'restaurant',
          'pageSize': pageSize,
          'openNow': true,
          'rankPreference': 'DISTANCE',
          'strictTypeFiltering': true,
          'locationRestriction': {
            'circle': {
              'center': {'latitude': latitude, 'longitude': longitude},
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

  Future<Photo?> fetchPhoto(String name) async {
    try {
      final response = await _client.get(
        '${Env.baseUrl}$name/media',
        options: Options(headers: {'Content-Type': 'application/json'}),
        queryParameters: {
          'key': Env.apiKey,
          'maxWidthPx': '4800',
          'maxHeightPx': '4800',
          'skipHttpRedirect': 'true',
        },
      );
      return Photo.fromPhotoJson(response.data as Map<String, String>);
    } catch (err) {
      print('API error: $err');
      return null;
    }
  }
}
