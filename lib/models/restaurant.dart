enum PriceLevel {
  unspecified,
  free,
  inexpensive,
  moderate,
  expensive,
  veryExpensive,
}

/// A collection of possible boolean "atmosphere" attributes that may be given
/// to a restaurant.
///
/// TODO: Figure out a more efficient way to manage the remaining atmosphere values.
class Atmosphere {
  final bool? goodForGroups;
  final bool? allowsDogs;
  final bool? reservable;
  final bool? servesBeer;
  final bool? servesWine;
  final bool? servesVegetarianFood;
  final bool? outdoorSeating;

  const Atmosphere({
    this.goodForGroups = false,
    this.allowsDogs = false,
    this.reservable = false,
    this.servesBeer = false,
    this.servesWine = false,
    this.servesVegetarianFood = false,
    this.outdoorSeating = false,
  });

  /// Creates an Atmosphere instance with values based on json input.
  /// If the associated value is not present in the json object, it will
  /// default to false.
  factory Atmosphere.fromPlacesApiJson(Map<String, dynamic> json) {
    return Atmosphere(
      goodForGroups: json['goodForGroups'] as bool? ?? false,
      allowsDogs: json['allowsDogs'] as bool? ?? false,
      reservable: json['reservable'] as bool? ?? false,
      servesBeer: json['servesBeer'] as bool? ?? false,
      servesWine: json['servesWine'] as bool? ?? false,
      servesVegetarianFood: json['servesVegetarianFood'] as bool? ?? false,
      outdoorSeating: json['outdoorSeating'] as bool? ?? false,
    );
  }
}

//TODO: Finish writing out description for Restaurant class
/// An instance of a restaurant.
class Restaurant {
  final String id; // Google Places API places_id
  final String name;
  final String address;
  final ({double latitude, double longitude}) location;

  final List<String> categoryTypes; // e.g., ['sports_bar', 'cat_cafe']
  final double? rating;
  final int? userRatingCount;
  final PriceLevel priceLevel;

  final String? summary;
  final String? websiteUri;
  final String? phoneNumber;

  final Atmosphere atmosphereValues;

  /// Stores the names of photos associated with a particular [Restaurant].
  ///
  /// NOTE: These are not image URIs, but rather strings that must be provided
  /// to a Place Photos API request.
  final List<String> photoNames;

  /// The time when a Restaurant's information is cached.
  final DateTime cachedAt;

  const Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.categoryTypes,
    this.rating,
    this.userRatingCount,
    this.priceLevel = PriceLevel.unspecified,
    this.summary,
    this.websiteUri,
    this.phoneNumber,
    this.atmosphereValues = const Atmosphere(),
    this.photoNames = const [],
    required this.cachedAt,
  });

  factory Restaurant.fromPlacesApiJson(Map<String, dynamic> json) {
    String? editorialSummary = json['editorialSummary']?['text'] as String?;
    String? generativeSummary = json['generativeSummary']?['text'] as String?;
    var summaryRecord = (editorialSummary, generativeSummary);

    return Restaurant(
      id: json['id']! as String,
      name: json['displayName']?['text'] as String? ?? '',
      address: json['formattedAddress'] as String? ?? '',
      location: (
        latitude: (json['location']?['latitude'] as num?)?.toDouble() ?? 0.0,
        longitude: (json['location']?['latitude'] as num?)?.toDouble() ?? 0.0,
      ),
      categoryTypes: (json['types'] as List<String>?) ?? [],
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      userRatingCount: json['userRatingCount'] as int? ?? 0,
      priceLevel: _parsePriceLevel(json['priceLevel'] as String? ?? ''),
      summary: switch (summaryRecord) {
        // Prefer to have the editorial summary over the generative summary
        (String editorial, _) => editorial,
        (null || '', String generative) => generative,
        _ => '',
      },
      websiteUri: json['websiteUri'] as String? ?? '',
      atmosphereValues: Atmosphere.fromPlacesApiJson(json),
      phoneNumber: json['phoneNumber'] as String? ?? '',
      photoNames:
          (json['photos'] as List<dynamic>?)
              ?.map((photo) => photo['name'] as String)
              .toList() ??
          [],
      cachedAt: DateTime.now(),
    );
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
    return '$name: $id';
  }
}
