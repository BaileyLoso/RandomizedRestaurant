import 'package:randomized_restaurant/models/restaurant.dart';

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
  servesBeer(bit: 1 << 19, label: 'Serves Beer'),

  /// Used when [stringToFlag] is given a malformed input
  undefined(bit: 1 << 32, label: 'Undefined');  

  const AtmosphereFlag({required this.bit, required this.label});

  static AtmosphereFlag stringToFlag(String label) {
    AtmosphereFlag flag = switch (label) {
      'takeout' => .takeout,
      'delivery' => .delivery,
      'dineIn' => .dineIn,
      'reservable' => .reservable,
      'goodForGroups' => .goodForGroups,
      'outdoorSeating' => .outdoorSeating,
      'liveMusic' => .liveMusic,
      'allowsDogs' => .allowsDogs,
      'goodForChildren' => .goodForChildren,
      'servesVegetarianFood' => .servesVegetarianFood,
      'servesBreakfast' => .servesBreakfast,
      'servesLunch' => .servesLunch,
      'servesBrunch' => .servesBrunch,
      'servesDinner' => .servesDinner,
      'servesCoffee' => .servesCoffee,
      'servesDessert' => .servesDessert,
      'servesCocktails' => .servesCocktails,
      'servesWine' => .servesWine,
      'servesBeer' => .servesBeer,
      _ => .undefined
    }; 
    return flag;
  }

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
