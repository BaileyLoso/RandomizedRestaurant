import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:randomized_restaurant/env.dart';
import 'package:randomized_restaurant/models/restaurant.dart';
import 'package:randomized_restaurant/models/photo.dart';

// TODO: API Error handling
class ApiClient {
  final Dio _client;

  ApiClient({Dio? dio})
    : _client = dio ?? Dio(BaseOptions(connectTimeout: Duration(seconds: 10)));

  Future<List<Restaurant>> fetchRestaurantsNearby({
    required int radius,
    double latitude = 44.97481647788996,
    double longitude = -93.26898500057966,
    Set<String> types = const {'restaurant'},
  }) async {
    try {
      final response = await _client.postUri(
        Uri.parse(Env.nearbySearchUrl),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-FieldMask': 'nextPageToken,places.id,places.displayName,places.types,places.formattedAddress,places.photos,places.primaryTypeDisplayName,places.types,places.currentOpeningHours,places.currentSecondaryOpeningHours,places.priceLevel,places.priceRange,places.rating,places.userRatingCount',
            'X-Goog-Api-Key': Env.apiKey,
          },
        ),
        data: {
          'includedTypes': types.toList(),
          'excludedPrimaryTypes': ['convenience_store, gas_station, supermarket, grocery_store, health_food_store, food_store'],
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
      return list;
    } catch (err) {
      print('API error: $err');
      return [];
    }
  }

  Future<List<Restaurant>> fetchRestaurantsText({
    required int radius,
    double latitude = 44.97481647788996,
    double longitude = -93.26898500057966,
    int pageSize = 20,
  }) async {
    try {
      final response = await _client.postUri(
        Uri.parse(Env.textSearchUrl),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-FieldMask': 'nextPageToken,places.id,places.displayName,places.types,places.formattedAddress,places.photos,places.primaryTypeDisplayName,places.types,places.currentOpeningHours,places.currentSecondaryOpeningHours,places.priceLevel,places.priceRange,places.rating,places.userRatingCount',
            'X-Goog-Api-Key': Env.apiKey,
          },
        ),
        data: {
          'textQuery': 'restaurant',
          'pageSize': pageSize,
          'openNow': true,
          'includedType': 'restaurant',
          'strictTypeFiltering': true,
          'rankPreference': 'DISTANCE',
          'locationBias': {
            'circle': {
              'center': {'latitude': latitude, 'longitude': longitude},
              'radius': radius,
            },
          },
        },
      );

      var res = response.data['places'] as List;
      var list = res.map((json) => Restaurant.fromPlacesApiJson(json)).toList();
      // var pageToken = response.data['nextPageToken'] as String? ?? '';
      // if (pageToken != '') {
      //   list.addAll(
      //     await fetchNextRestaurants(
      //       radius: radius,
      //       latitude: latitude,
      //       longitude: longitude,
      //       pageSize: pageSize,
      //       pageToken: pageToken,
      //     ),
      //   );
      // }
      return list;
    } catch (err) {
      print('API error: $err');
      return [];
    }
  }

  Future<List<Restaurant>> fetchSampleRestaurants({
    int? radius,
    double? latitude,
    double? longitude,
    double? pageSize,
  }) async {
    var res = await rootBundle.loadString(
      'test/fixtures/test_request_data.json',
    );
    var data = jsonDecode(res) as Map<String, dynamic>;
    var list = (data['places'] as List<dynamic>)
        .map((json) => Restaurant.fromPlacesApiJson(json))
        .toList();
    return list;
  }

  Future<List<Restaurant>> fetchNextRestaurants({
    required int radius,
    required double latitude,
    required double longitude,
    required int pageSize,
    required String pageToken,
  }) async {
    try {
      final response = await _client.postUri(
        Uri.parse(Env.textSearchUrl),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-FieldMask': 'nextPageToken,places.id,places.displayName,places.types,places.formattedAddress,places.photos,places.primaryTypeDisplayName,places.types,places.currentOpeningHours,places.secondaryOpeningHours,places.priceLevel,places.priceRange,place.rating,place.userRatingCount',
            'X-Goog-Api-Key': Env.apiKey,
          },
        ),
        data: {
          'textQuery': 'food',
          'pageSize': pageSize,
          'openNow': true,
          'rankPreference': 'DISTANCE',
          'pageToken': pageToken,
          'locationBias': {
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

  Future<Photo> fetchPhoto(String name) async {
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
      return Photo.fromPhotoJson(response.data as Map<String, dynamic>);
    } catch (err) {
      print('API error: $err');
      return Photo(name: '', uri: '');
    }
  }

  Future<Photo> fetchSamplePhoto(String photoName) async {
    final res = await _client.get(
      'https://cataas.com/cat/says/Hello%20World?position=center&json=true&font=Impact&fontSize=50&fontColor=%23fff&fontBackground=none',
    );
    final json = {'name': photoName, 'photoUri': res.data['url']};
    return Photo.fromPhotoJson(json);
  }
}
