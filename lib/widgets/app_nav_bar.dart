import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppNavBar extends StatelessWidget {
  AppNavBar({super.key, required this.indexValue});

  int? indexValue;


  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: indexValue ?? 0,
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.search_sharp), label: 'Browse'),
        NavigationDestination(
          icon: Icon(Icons.favorite_rounded),
          label: 'Favorites',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Profile',
        ),
      ],
      onDestinationSelected: (val) {
        print(val);
      },
    );
  }
}
