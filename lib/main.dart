import 'package:flutter/material.dart';
import 'package:randomized_restaurant/ui/screens/browse_screen.dart';
import 'package:randomized_restaurant/ui/screens/favorites_screen.dart';
import 'package:randomized_restaurant/ui/screens/home_screen.dart';
import 'package:randomized_restaurant/ui/screens/user_profile_screen.dart';
import 'package:randomized_restaurant/ui/core/theme/theme.dart';
import 'package:randomized_restaurant/ui/core/theme/util.dart';
import 'package:randomized_restaurant/widgets/app_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:randomized_restaurant/ui/screens/result_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  routes: [
    ShellRoute(
      navigatorKey: _rootNavigatorKey,
      builder: (context, state, child) =>
          Scaffold(body: child, bottomNavigationBar: AppNavBar()),
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),
        GoRoute(path: '/result', builder: (context, state) => ResultScreen()),
        GoRoute(
          path: '/userProfile',
          builder: (context, state) => UserProfileScreen(),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => FavoritesScreen(),
        ),
        GoRoute(path: '/browse', builder: (context, state) => BrowseScreen()),
      ],
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, 'Lato', 'Inter');
    MaterialTheme theme = MaterialTheme(textTheme);

    // Note
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: brightness == Brightness.light
          ? theme.lightMediumContrast()
          : theme.lightMediumContrast(),
      // theme: theme.lightMediumContrast(),
    );
  }
}

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
