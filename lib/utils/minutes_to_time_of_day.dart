import 'package:flutter/material.dart';
import 'package:sweep_steaks/models/operating_hours.dart';

/// Conversion tool for when using data times from [Day] instances. Takes the
/// minutes since midnight value of a time and creates a TimeOfDay instance for
/// use in Flutter widgets
extension MinutesToTimeOfDay on int {
  TimeOfDay toTimeOfDay() => TimeOfDay(hour: this ~/ 60, minute: this % 60);
}

extension MinutesFromMidnight on DateTime {
  int minutesFromMidnight() => hour * 60 + minute;
}
