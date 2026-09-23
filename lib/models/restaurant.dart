import 'package:randomized_restaurant/models/atmosphere.dart';
import 'package:randomized_restaurant/models/operating_hours.dart';

enum PriceLevel {
  unspecified,
  free,
  inexpensive,
  moderate,
  expensive,
  veryExpensive,
}

/// An instance of a restaurant.
class Restaurant {
  final String id; // Google Places API places_id
  final String name;
  final String address;
  final ({double latitude, double longitude}) location;
  final OperatingHours operatingHours;
  final List<String> categoryTypes; // e.g., ['sports_bar', 'cat_cafe']
  final String primaryType;
  final double rating;
  final int userRatingCount;
  final PriceLevel priceLevel;
  final ({String startPrice, String endPrice}) priceRange;
  final String summary;
  final String websiteUri;
  final String googleMapsUri;
  final String phoneNumber;
  final List<AtmosphereFlag> atmosphereFlags;

  /// The primary photo
  ({String name, int width, int height}) photo;

  /// Stores the names of photos associated with a particular [Restaurant].
  ///
  /// NOTE: These are not image URIs, but rather strings that must be provided
  /// to a Place Photos API request.
  final List<({String name, int width, int height})> photos;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.operatingHours,
    required this.categoryTypes,
    required this.primaryType,
    required this.rating,
    required this.userRatingCount,
    required this.priceLevel,
    required this.priceRange,
    required this.summary,
    required this.websiteUri,
    required this.googleMapsUri,
    required this.phoneNumber,
    required this.atmosphereFlags,
    this.photo = (name: '', width: 0, height: 0),
    required this.photos,
  });

  factory Restaurant.fromPlacesApiJson(Map<String, dynamic> json) {
    String? editorialSummary = json['editorialSummary']?['text'] as String?;
    String? generativeSummary =
        json['generativeSummary']?['overview']?['text'] as String?;
    var summaryRecord = (editorialSummary, generativeSummary);

    var r = Restaurant(
      id: json['id']! as String,
      name: json['displayName']?['text'] as String? ?? '',
      address: json['formattedAddress'] as String? ?? '',
      location: (
        latitude: (json['location']?['latitude'] as num?)?.toDouble() ?? 0.0,
        longitude: (json['location']?['longitude'] as num?)?.toDouble() ?? 0.0,
      ),
      operatingHours: OperatingHours.fromPlacesApiJson(json),
      categoryTypes: (json['types'] as List<dynamic>?)?.cast<String>() ?? [],
      primaryType: json['primaryType'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      userRatingCount: json['userRatingCount'] as int? ?? 0,
      priceLevel: _parsePriceLevel(json['priceLevel'] as String? ?? ''),
      priceRange: (
        startPrice:
            json['priceRange']?['startPrice']?['units'] as String? ?? '',
        endPrice: json['priceRange']?['endPrice']?['units'] as String? ?? '',
      ),
      summary: switch (summaryRecord) {
        // Prefer to have the editorial summary over the generative summary
        (String editorial, _) when editorial.isNotEmpty => editorial,
        (null || '', String generative) => generative,
        _ => '',
      },
      websiteUri: json['websiteUri'] as String? ?? '',
      googleMapsUri: json['googleMapsUri'] as String? ?? '',
      atmosphereFlags: Atmosphere.fromPlacesApiJson(json).activeFlags,
      phoneNumber: json['nationalPhoneNumber'] as String? ?? '',
      photos:
          (json['photos'] as List<dynamic>?)
              ?.where((photo) {
                var author =
                    photo['authorAttributions']?[0]?['displayName'] as String?;
                if (author != null &&
                    author == (json['displayName']?['text'] as String? ?? '')) {
                  return (photo['widthPx'] as int? ?? 0) >= 360 &&
                      (photo['heightPx'] as int? ?? 0) >= 180;
                } else {
                  return true;
                }
              })
              .map(
                (photo) => (
                  name: photo['name'] as String,
                  width: photo['widthPx'] as int,
                  height: photo['heightPx'] as int,
                ),
              )
              .toList() ??
          [],
    );

    r.initPrimaryPhoto();
    return r;
  }

  void initPrimaryPhoto() {
    photo = photos.isNotEmpty ? photos.first : photo;
  }

  /// Returns the [PriceLevel] enum value from a string value.
  /// This string value is provided by the Google Places API response as
  /// "priceLevel".
  static PriceLevel _parsePriceLevel(String? value) {
    switch (value) {
      case 'PRICE_LEVEL_FREE':
        return PriceLevel.free;
      case 'PRICE_LEVEL_INEXPENSIVE':
        return PriceLevel.inexpensive;
      case 'PRICE_LEVEL_MODERATE':
        return PriceLevel.moderate;
      case 'PRICE_LEVEL_EXPENSIVE':
        return PriceLevel.expensive;
      case 'PRICE_LEVEL_VERY_EXPENSIVE':
        return PriceLevel.veryExpensive;
      default:
        return PriceLevel.unspecified;
    }
  }

  /// Checks whether [other] is a [Restaurant] with the same [id].
  @override
  bool operator ==(Object other) {
    return other is Restaurant && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '''
      Name: $name
      Id: $id
      Address: $address
      Location: $location
      Categories: $categoryTypes
      Primary Type: $primaryType
      Rating: $rating
      User Rating Count: $userRatingCount
      Price Level: $priceLevel
      Summary: "$summary"
      Website: $websiteUri
      Phone Number: $phoneNumber
      Atmophere Flags: $atmosphereFlags
      Photo Names: $photos
    ''';
  }
}
