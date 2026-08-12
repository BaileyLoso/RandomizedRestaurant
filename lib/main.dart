import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:randomized_restaurant/ui/screens/browse_screen.dart';
import 'package:randomized_restaurant/ui/screens/favorites_screen.dart';
import 'package:randomized_restaurant/ui/screens/home_screen.dart';
import 'package:randomized_restaurant/ui/screens/user_profile_screen.dart';
import 'package:randomized_restaurant/ui/core/theme/theme.dart';
import 'package:randomized_restaurant/ui/core/theme/util.dart';
import 'package:randomized_restaurant/ui/core/shared_widgets/app_nav_bar.dart';
import 'package:randomized_restaurant/ui/screens/result_screen.dart';
import 'package:randomized_restaurant/routing/routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final routes = Routes().routes;
final _router = GoRouter(
  routes: [
    ShellRoute(
      navigatorKey: _rootNavigatorKey,
      builder: (context, state, child) =>
          Scaffold(body: child, bottomNavigationBar: AppNavBar()),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/result',
          name: 'result',
          builder: (context, state) => ResultScreen(),
        ),
        GoRoute(
          path: '/userProfile',
          name: 'userProfile',
          builder: (context, state) => UserProfileScreen(),
        ),
        GoRoute(
          path: '/favorites',
          name: 'favorites',
          builder: (context, state) => FavoritesScreen(),
        ),
        GoRoute(
          path: '/browse',
          name: 'browse',
          builder: (context, state) => BrowseScreen(),
        ),
      ],
    ),
    ...routes,
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
