import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/models/operating_hours.dart';

import 'hours_dropdown.dart';

import 'package:randomized_restaurant/utils/minutes_to_time_of_day.dart';
import 'package:randomized_restaurant/utils/string_helpers.dart';

/// A card view of the operating hours and corresponding weekdays for a
/// place.
///
/// This widget is typically used with [HoursDropdown] to create a collapsable
/// list of times that a location is open.
class OperatingHoursCard extends ConsumerWidget {
  /// Creates an OperatingHoursCard widget.
  ///
  /// If the [secondaryHoursType] argument is null, this defaults to creating
  /// a non-collapsable card with the primary operating hours. Providing
  /// [secondaryHoursType] will create a collapsable [ExpansionTile] with the
  /// operating hours of that type.
  const OperatingHoursCard({
    super.key,
    required this.operatingHours,
    this.secondaryHoursType,
  });

  /// A collection of primary and secondary operating hours.
  final OperatingHours operatingHours;

  /// The category of operating hours aside from normal business hours.
  final String? secondaryHoursType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);

    if (secondaryHoursType == null) {
      return Padding(
        padding: const .only(bottom: 16),
        child: Column(
          spacing: 16,
          children: [
            Center(
              child: Text(
                'Primary Hours',
                style: textTheme.bodyLarge?.copyWith(fontWeight: .bold),
              ),
            ),
            ...operatingHours.days.map((day) {
              return Padding(
                padding: const .symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: .start,
                  children: [
                    Text(
                      '${day.dayName()}:',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        day.primaryPeriods
                            .map((p) {
                              final start = p.$1.toTimeOfDay().format(context);
                              final end = p.$2?.toTimeOfDay().format(context);
                              return '$start–$end';
                            })
                            .join('\n'),
                        textAlign: .end,
                        style: textTheme.bodyMedium?.copyWith(),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      );
    }

    return ExpansionTile(
      maintainState: true,
      title: Center(
        child: Text(
          secondaryHoursType
                  ?.replaceAll('_', ' ')
                  .toLowerCase()
                  .toTitleCase() ??
              '',
          style: textTheme.bodyLarge?.copyWith(fontWeight: .bold),
        ),
      ),

      children: [
        Padding(
          padding: const .only(bottom: 16.0),
          child: Column(
            spacing: 16,
            children: [
              ...operatingHours.days
                  .where(
                    (day) =>
                        day.secondaryPeriods[secondaryHoursType]?.isNotEmpty ??
                        false,
                  )
                  .map((day) {
                    return Padding(
                      padding: const .symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: .start,
                        children: [
                          Text(
                            '${day.dayName()}:',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              day.secondaryPeriods[secondaryHoursType]
                                      ?.map((p) {
                                        final start = p.$1.toTimeOfDay().format(
                                          context,
                                        );
                                        final end = p.$2.toTimeOfDay().format(
                                          context,
                                        );
                                        return '$start–$end';
                                      })
                                      .join('\n') ??
                                  '',
                              textAlign: .end,
                              style: textTheme.bodyMedium?.copyWith(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
