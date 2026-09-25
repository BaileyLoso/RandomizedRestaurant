import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sweep_steaks/ui/screens/favorites_screen.dart';
import 'package:sweep_steaks/ui/screens/home_screen.dart';
import 'package:sweep_steaks/ui/core/theme/theme.dart';
import 'package:sweep_steaks/ui/core/theme/util.dart';
import 'package:sweep_steaks/ui/core/shared_widgets/app_nav_bar.dart';
import 'package:sweep_steaks/ui/screens/result_screen.dart';
import 'package:sweep_steaks/routing/routes.dart';

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
          path: '/favorites',
          name: 'favorites',
          builder: (context, state) => FavoritesScreen(),
        ),
      ],
    ),
    ...routes,
  ],
);

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'SweepSteaks',
      theme: brightness == Brightness.light
          ? theme.lightMediumContrast()
          : theme.lightMediumContrast(),
    );
  }
}
