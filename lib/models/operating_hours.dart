import 'package:randomized_restaurant/models/restaurant.dart';
import 'package:randomized_restaurant/utils/minutes_to_time_of_day.dart';

/// An instance containing the full operating hours of a [Restaurant] instance
/// for an entire week.
class OperatingHours {
  final List<Day> days;

  OperatingHours({required this.days});

  factory OperatingHours.fromPlacesApiJson(Map<String, dynamic> json) {
    return OperatingHours(
      days: List.generate(
        7,
        (int dayOfWeek) => Day.fromPlacesApiJson(json, dayOfWeek),
      ),
    );
  }

  Day day(int dayOfWeek) => days[dayOfWeek % 7];

  @override
  String toString() {
    return days.toString();
  }
}

/// A single day of the week's operating hours for a restaurant, including
/// any secondary operating hours (Example: "happy hour", "drive thru", etc.).
/// The [dayOfWeek] instance variable is zero-indexed starting on Sunday.
///
/// For simplicity, times are stored as minutes since midnight, but they can be
/// converted to a TimeOfDay instance for use in Flutter widgets with the
/// [MinutesToTimeOfDay] int extension.
class Day {
  final int dayOfWeek;
  final List<(int, int?)> primaryPeriods;
  final Map<String, List<(int, int)>> secondaryPeriods;

  Day({
    required this.dayOfWeek,
    required this.primaryPeriods,
    this.secondaryPeriods = const {},
  });

  factory Day.fromPlacesApiJson(Map<String, dynamic> json, int day) {
    final secondaryList =
        ((json['currentSecondaryOpeningHours'] as List<dynamic>?) ?? [])
            .cast<Map<String, dynamic>>();

    return Day(
      dayOfWeek: day,
      primaryPeriods: _periodsForDay(
        json['currentOpeningHours']?['periods'],
        day,
      ),
      secondaryPeriods: {
        for (final secondaryDay in secondaryList)
          (secondaryDay['secondaryHoursType'] as String? ?? ''): _periodsForDay(
            secondaryDay['periods'],
            day,
          ),
      },
    );
  }

  /// Returns a list of records with an open-to-close period for a given day.
  static List<(int, int)> _periodsForDay(dynamic periodsJson, int day) {
    final periods = ((periodsJson as List<dynamic>?) ?? [])
        .cast<Map<String, dynamic>>();

    return periods
        .where((period) => (period['open']?['day'] as num?)?.toInt() == day)
        .map((period) => (_minutes(period['open']), _minutes(period['close'])))
        .toList();
  }

  /// Parses a JSON object representing a time's hour and minutes into an
  /// integer representing the minutes since midnight.
  static int _minutes(Map<String, dynamic> time) {
    final hour = (time['hour'] as num?)?.toInt() ?? 0;
    final minute = (time['minute'] as num?)?.toInt() ?? 0;
    return hour * 60 + minute;
  }

  String dayName() {
    return switch (dayOfWeek) {
      0 => 'Sunday',
      1 => 'Monday',
      2 => 'Tuesday',
      3 => 'Wednesday',
      4 => 'Thursday',
      5 => 'Friday',
      6 => 'Saturday',
      _ => 'Invalid value',
    };
  }

  @override
  String toString() {
    return '$dayOfWeek, $primaryPeriods, $secondaryPeriods';
  }
}
