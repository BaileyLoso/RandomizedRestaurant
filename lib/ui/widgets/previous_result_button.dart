import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sweep_steaks/ui/view_models/result_view_model.dart';

class PreviousResultButton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;

    final buttonStyle = ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedSuperellipseBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
      ),
      maximumSize: WidgetStatePropertyAll(Size(125, 40)),
      backgroundColor: WidgetStateColor.fromMap(<WidgetStatesConstraint, Color>{
        WidgetState.focused | WidgetState.pressed: theme.tertiary,
        WidgetState.disabled: theme.secondaryContainer,
        WidgetState.any: theme.tertiaryContainer,
      }),
    );

    return FilledButton(
      style: buttonStyle,
      onPressed: () =>
          ref.read(resultViewModelProvider.notifier).previousRestaurant(),
      child: Row(
        mainAxisAlignment: .center,
        mainAxisSize: .min,
        children: [
          const Icon(Icons.chevron_left),
          const SizedBox(width: 4),
          Text(
            'Back',
            style: textTheme.labelLarge?.copyWith(
              color: theme.onTertiaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
