import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sweep_steaks/ui/view_models/result_view_model.dart';

class AttributesDropdown extends ConsumerWidget {
  const AttributesDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);
    final style = ColorScheme.of(context);
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
      padding: const .symmetric(horizontal: 8),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: .circular(25)),
        collapsedShape: RoundedRectangleBorder(borderRadius: .circular(25)),

        title: Text('Offerings', style: textTheme.titleLarge),
        maintainState: true,
        visualDensity: .compact,
        children: [
          Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: flags
                  .map(
                    (flag) => Chip(
                      label: Text(
                        flag.label,
                        style: textTheme.bodyMedium?.copyWith(
                          color: style.onTertiaryContainer,
                        ),
                      ),
                      backgroundColor: style.tertiaryContainer,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
