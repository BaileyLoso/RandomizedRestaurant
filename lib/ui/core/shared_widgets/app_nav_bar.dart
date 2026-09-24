import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    int currentPageIndex = 0;

    switch (location) {
      case '/favorites':
        currentPageIndex = 1;
        break;
      case '/':
      default:
        currentPageIndex = 0;
        break;
    }

    final themeStyle = Theme.of(context).colorScheme;
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: themeStyle.onTertiaryContainer);
          }
          return IconThemeData(color: themeStyle.tertiaryContainer);
        }),
        backgroundColor: themeStyle.surfaceContainer,
      ),
      child: NavigationBar(
        height: 56,
        selectedIndex: currentPageIndex,
        indicatorColor: themeStyle.tertiaryContainer,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.favorite_rounded),
            // icon: Badge(child: Icon(Icons.favorite_rounded)),
            label: 'Favorites',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          switch (index) {
            case 0:
              context.goNamed('home');
              break;
            case 1:
              context.go('favorites');
              break;
          }
        },
      ),
    );
  }
}
