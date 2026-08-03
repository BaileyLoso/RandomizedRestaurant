import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RandomizeButton extends StatelessWidget {
  const RandomizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final ButtonStyle style = ButtonStyle(
      backgroundColor:
          WidgetStateProperty.fromMap(<WidgetStatesConstraint, Color>{
            WidgetState.focused | WidgetState.pressed: theme.tertiary,
            WidgetState.disabled: theme.secondaryContainer,
            WidgetState.any: theme.tertiaryContainer,
          }),
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
            onPressed: () => context.push('/result'),
            child: Center(
              child: Text(
                'Feed Me Something',
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
