import 'package:flutter/material.dart';
import 'package:randomized_restaurant/widgets/randomize_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Restaurant Randomizer'))),
      body: Center(child: RandomizeButton()),
    );
  }
}
