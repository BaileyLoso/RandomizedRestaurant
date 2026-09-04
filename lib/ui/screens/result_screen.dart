import 'dart:math';

import 'package:flutter/material.dart';
import 'package:randomized_restaurant/widgets/next_button.dart';
import 'package:randomized_restaurant/widgets/restaurant_card_view.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    // TODO fix scaling of toolbar icons
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        centerTitle: true,
        toolbarHeight: min(MediaQuery.heightOf(context) * 0.1, 52),
        iconTheme: IconThemeData(applyTextScaling: true),

        actions: [
          Center(
            widthFactor: 1.38,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: IconButton(
                onPressed: () => print("Not ready yet"),
                icon: Icon(Icons.person_off_outlined),
              ),
            ),
          ),
        ],
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'How\'s this?',
            style: textTheme.headlineLarge,
            maxLines: 1,
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.only(top: 8),

        children: [RestaurantCardView(), NextResultButton()],
      ),
    );
  }
}
