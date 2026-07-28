import 'package:flutter/material.dart';
import 'package:randomized_restaurant/theme/theme.dart';
import 'package:randomized_restaurant/theme/util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomized_restaurant/widgets/app_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, 'Lato', 'Inter');
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      theme: theme.lightMediumContrast(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Restaurant Randomizer'))),
      body: Center(child: RandomizeButton()),
      bottomNavigationBar: AppNavBar(indexValue: 0),
    );
  }
}

class RandomizeButton extends StatelessWidget {
  RandomizeButton({super.key});

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
            onPressed: () => print('Button Pressed'),
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
