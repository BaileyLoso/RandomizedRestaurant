import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sweep_steaks/data/repositories/filter_repository.dart';
import 'package:sweep_steaks/models/categories.dart';

class FilterButton extends ConsumerWidget {
  const new({super.key, required this.category});
  final FoodCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ColorScheme.of(context);
    final selectedCategories = ref.watch(filterRepositoryProvider);
    final notifier = ref.watch(filterRepositoryProvider.notifier);

    return FilterChip(
      label: Text(category.label),
      selected: selectedCategories.contains(category),
      onSelected: (bool selected) {
        if (selected) {
          notifier.add(category);
        } else {
          notifier.remove(category);
        }
      },
      color: WidgetStateProperty.fromMap(<WidgetStatesConstraint, Color>{
        WidgetState.selected: theme.tertiaryContainer,
        WidgetState.any: theme.surfaceContainer,
        WidgetState.pressed: theme.tertiary,
      }),
    );
  }
}
