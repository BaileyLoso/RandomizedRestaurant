import 'dart:math';

import 'package:flutter/material.dart';
import 'package:randomized_restaurant/ui/widgets/next_result_button.dart';
import 'package:randomized_restaurant/ui/widgets/previous_result_button.dart';
import 'package:randomized_restaurant/ui/widgets/restaurant_card_view.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        centerTitle: true,
        toolbarHeight: min(MediaQuery.heightOf(context) * 0.1, 52),
        iconTheme: IconThemeData(applyTextScaling: true),
        title: FittedBox(
          fit: .scaleDown,
          child: Text(
            'How\'s this?',
            style: textTheme.headlineLarge,
            maxLines: 1,
          ),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const .only(top: 8),
                child: RestaurantCardView(),
              ),
            ),
            SafeArea(
              child: FittedBox(
                fit: .scaleDown,

                child: Padding(
                  padding: const .only(bottom: 12.0),
                  child: Row(
                    spacing: 16,
                    mainAxisAlignment: .center,

                    children: [PreviousResultButton(), NextResultButton()],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
