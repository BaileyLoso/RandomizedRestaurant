import 'package:flutter/material.dart';
import 'package:randomized_restaurant/ui/widgets/filter_overlay.dart';
import 'package:randomized_restaurant/ui/widgets/randomize_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'FeastFinder',
            style: textTheme.headlineLarge?.copyWith(color: theme.onSurface),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 16,
          children: [RandomizeButton(), FilterOverlay()],
        ),
      ),
    );
  }
}
