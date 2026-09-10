import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/ui/core/theme/theme.dart';
import 'package:randomized_restaurant/ui/view_models/result_view_model.dart';
import 'package:randomized_restaurant/utils/minutes_to_time_of_day.dart';
import 'package:randomized_restaurant/widgets/operating_hours_card.dart';

class HoursDropdown extends ConsumerWidget {
  const HoursDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);
    final style = ColorScheme.of(context);
    final hours = ref
        .read(resultViewModelProvider)
        .pickedRestaurant
        ?.operatingHours;

    if (hours == null) {
      return ExpansionTile(
        title: Text('Hours', style: textTheme.titleLarge),
        enabled: false,
      );
    }

    final currentTime = DateTime.now();
    final periods = hours.day(currentTime.weekday).primaryPeriods;

    final closingTime = periods.isEmpty ? null : periods.last.$2 ?? 1440;
    final timeToClose = closingTime == null
        ? null
        : closingTime - currentTime.minutesFromMidnight();

    final secondaryHourTypes = hours.days
        .expand((day) => day.secondaryPeriods.keys)
        .toSet()
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(borderRadius: .circular(25)),
        shape: RoundedRectangleBorder(borderRadius: .circular(25)),

        title: Text('Hours', style: textTheme.titleLarge),
        subtitle: timeToClose == null
            ? Text('Closed', style: textTheme.titleMedium)
            : switch (timeToClose) {
                >= 60 => Text(
                  'Open until ${closingTime!.toTimeOfDay().format(context)}',
                  style: textTheme.titleMedium?.copyWith(
                    color: MaterialTheme.success.value,
                  ),
                ),
                > 0 => Text(
                  'Closing soon at ${closingTime!.toTimeOfDay().format(context)}',
                  style: textTheme.titleMedium?.copyWith(color: style.tertiary),
                ),
                _ => Text(
                  'Closed',
                  style: textTheme.titleMedium?.copyWith(color: style.error),
                ),
              },
        childrenPadding: .directional(top: 8),
        children: [
          OperatingHoursCard(operatingHours: hours),
          ...secondaryHourTypes.map(
            (type) => OperatingHoursCard(
              operatingHours: hours,
              secondaryHoursType: type,
            ),
          ),
        ],
      ),
    );
  }
}
