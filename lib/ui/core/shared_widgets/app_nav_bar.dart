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
      case '/browse':
        currentPageIndex = 1;
        break;
      case '/favorites':
        currentPageIndex = 2;
        break;
      case '/userProfile':
        currentPageIndex = 3;
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
        selectedIndex: currentPageIndex,
        indicatorColor: themeStyle.tertiaryContainer,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.search_sharp),
            label: 'Browse',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_rounded),
            // icon: Badge(child: Icon(Icons.favorite_rounded)),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
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
              context.go('browse');
              break;
            case 2:
              context.go('favorites');
              break;
            case 3:
              context.go('userProfile');
              break;
          }
        },
      ),
    );
  }
}
