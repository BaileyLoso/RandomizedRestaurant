import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/ui/view_models/result_view_model.dart';

class AttributesDropdown extends ConsumerWidget {
  const AttributesDropdown({
    super.key,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
  });

  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);
    final flags = ref
        .read(resultViewModelProvider)
        .pickedRestaurant
        ?.atmosphereFlags;

    if (flags == null) {
      return ExpansionTile(
        title: const Text('Atmosphere'),
        subtitle: const Text('No tags found'),
        enabled: false,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ExpansionTile(
        backgroundColor: backgroundColor ?? collapsedBackgroundColor,
        collapsedBackgroundColor: collapsedBackgroundColor ?? backgroundColor,
        iconColor: textColor,
        collapsedIconColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: .circular(25)),
        collapsedShape: RoundedRectangleBorder(borderRadius: .circular(25)),

        title: Text(
          'Offerings',
          style: textTheme.titleLarge?.copyWith(color: textColor),
        ),
        maintainState: true,
        visualDensity: .compact,
        children: [
          Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: flags
                  .map((flag) => Chip(label: Text(flag.label)))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
