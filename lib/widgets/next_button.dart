import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/ui/view_models/result_view_model.dart';

class NextButton extends ConsumerWidget {
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
      maximumSize: WidgetStatePropertyAll(Size(200, 40)),
      backgroundColor: WidgetStateColor.fromMap(<WidgetStatesConstraint, Color>{
        WidgetState.focused | WidgetState.pressed: theme.tertiary,
        WidgetState.disabled: theme.secondaryContainer,
        WidgetState.any: theme.tertiaryContainer,
      }),
    );

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: TextButton(
        style: buttonStyle,
        onPressed: () =>
            ref.read(resultViewModelProvider.notifier).nextRestaurant(),

        child: Center(
          widthFactor: 1.25,
          child: Text(
            'Next Restaurant',
            style: textTheme.labelLarge?.copyWith(
              color: theme.onTertiaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
