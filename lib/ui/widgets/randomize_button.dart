import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sweep_steaks/ui/view_models/result_view_model.dart';

class RandomizeButton extends ConsumerWidget {
  const RandomizeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Listen for when results start loading to push
    ref.listen(resultViewModelProvider, (previous, next) {
      if (previous?.isLoading != true && next.isLoading) {
        context.pushNamed('result');
      }
    });

    final ButtonStyle style = ButtonStyle(
      backgroundColor: WidgetStateProperty.fromMap(
        <WidgetStatesConstraint, Color>{
          WidgetState.focused | WidgetState.pressed: theme.tertiary,
          WidgetState.disabled: theme.secondaryContainer,
          WidgetState.any: theme.tertiaryContainer,
        },
      ),
      shape: WidgetStateProperty.fromMap(
        <WidgetStatesConstraint, OutlinedBorder>{
          WidgetState.any: CircleBorder(),
        },
      ),
    );

    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child: ElevatedButton(
            style: style,
            onPressed: () {
              ref.read(resultViewModelProvider.notifier).load();
            },
            child: Center(
              child: Text(
                'Find Me a New Craving',
                style: textTheme.headlineLarge?.copyWith(
                  color: theme.onTertiaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
