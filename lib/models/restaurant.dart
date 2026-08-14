enum PriceLevel {
  unspecified,
  free,
  inexpensive,
  moderate,
  expensive,
  veryExpensive,
}

/// A bit representation of the possible atmosphere tags assignable to a
/// [Restaurant].
enum AtmosphereFlag {
  takeout(bit: 1 << 1, label: 'Takeout'),
  delivery(bit: 1 << 2, label: 'Delivery'),
  dineIn(bit: 1 << 3, label: 'Dine In'),
  reservable(bit: 1 << 4, label: 'Reservable'),
  goodForGroups(bit: 1 << 5, label: 'Good for Groups'),
  outdoorSeating(bit: 1 << 6, label: 'Outdoor Seating'),
  liveMusic(bit: 1 << 7, label: 'Live Music'),
  allowsDogs(bit: 1 << 8, label: 'Allows Dogs'),
  goodForChildren(bit: 1 << 9, label: 'Good For Children'),
  servesVegetarianFood(bit: 1 << 10, label: 'Serves Vegetarian Food'),
  servesBreakfast(bit: 1 << 11, label: 'Serves Breakfast'),
  servesLunch(bit: 1 << 12, label: 'Serves Lunch'),
  servesBrunch(bit: 1 << 13, label: 'Serves Brunch'),
  servesDinner(bit: 1 << 14, label: 'Serves Dinner'),
  servesCoffee(bit: 1 << 15, label: 'Serves Coffee'),
  servesDessert(bit: 1 << 16, label: 'Serves Dessert'),
  servesCocktails(bit: 1 << 17, label: 'Serves Cocktails'),
  servesWine(bit: 1 << 18, label: 'Serves Wine'),
  servesBeer(bit: 1 << 19, label: 'Serves Beer');

  const AtmosphereFlag({required this.bit, required this.label});

  final int bit;
  final String label;
}

/// A bitmask representation of the different "atmosphere" tags used by the Google
/// Places API.
class Atmosphere {
  final int _mask;
  const Atmosphere(this._mask);

  /// Returns the active atmosphere flags represented by the current bitmask.
  List<AtmosphereFlag> get activeFlags => AtmosphereFlag.values
      .where((AtmosphereFlag flag) => (_mask & flag.bit) != 0)
      .toList();

  /// Builds an [Atmosphere] from the Google Places API JSON response.
  factory Atmosphere.fromPlacesApiJson(Map<String, dynamic> json) {
    int mask = 0;
    for (final flag in AtmosphereFlag.values) {
      if (json[flag.name] == true) {
        mask |= flag.bit;
      }
    }
    return Atmosphere(mask);
  }

  @override
  String toString() {
    return '''
      $_mask
      $activeFlags
      ''';
  }
}

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
  final List<AtmosphereFlag> atmosphereFlags;

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
    this.atmosphereFlags = const [],
    this.photoNames = const [],
    required this.cachedAt,
  });

  factory Restaurant.fromPlacesApiJson(Map<String, dynamic> json) {
    String? editorialSummary = json['editorialSummary']?['text'] as String?;
    String? generativeSummary =
        json['generativeSummary']?['overview']?['text'] as String?;
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
      atmosphereFlags: Atmosphere.fromPlacesApiJson(json).activeFlags,
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
    return '''
      Name: $name
      Id: $id
      Address: $address
      Location: $location
      Categories: $categoryTypes
      Rating: $rating
      User Rating Count: $userRatingCount
      Price Level: $priceLevel
      Summary: "$summary"
      Website: $websiteUri
      Phone Number: $phoneNumber
      Atmophere Flags: $atmosphereFlags
      Photo Names: $photoNames
      Cached Time: $cachedAt
    ''';
  }
}
