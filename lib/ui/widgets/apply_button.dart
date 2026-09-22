import 'package:flutter/material.dart';

class ApplyButton extends StatelessWidget {
  const new({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    final ButtonStyle buttonStyle = ButtonStyle(
      padding: .all(.symmetric(vertical: 16, horizontal: 24)),
      backgroundColor: WidgetStateProperty.fromMap(
        <WidgetStatesConstraint, Color>{
          WidgetState.focused | WidgetState.pressed: theme.tertiary,
          WidgetState.disabled: theme.secondaryContainer,
          WidgetState.any: theme.tertiaryContainer,
        },
      ),
      shape: WidgetStateProperty.fromMap(
        <WidgetStatesConstraint, OutlinedBorder>{
          WidgetState.any: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        },
      ),
    );
    return TextButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        'Apply',
        style: textTheme.labelLarge?.copyWith(color: theme.onTertiaryContainer),
      ),
    );
  }
}
