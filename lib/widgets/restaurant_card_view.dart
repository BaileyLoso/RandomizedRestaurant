import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:randomized_restaurant/ui/core/theme/theme.dart';

class RestaurantCardView extends StatefulWidget {
  const RestaurantCardView({super.key});

  @override
  State<RestaurantCardView> createState() => _RestaurantCardViewState();
}

class _RestaurantCardViewState extends State<RestaurantCardView> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(24.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(
                  "restaurantDetails",
                  pathParameters: {'id': "4"},
                ),
                child: Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 450.0,
                        maxWidth: 400.0,
                      ),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),

                        /// TODO: The rectangle needs to conditionally show the restaurant's photo
                        gradient: LinearGradient(
                          colors: [theme.primaryContainer, theme.primary],
                          begin: AlignmentGeometry.topCenter,
                          end: AlignmentGeometry.bottomCenter,
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 8 / 9,
                        child: SizedBox.expand(),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: Text(
                        "More Details ->",
                        style: TextStyle(color: theme.onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "John's Magical Restaurant Which Serves Food With Really Long Food Names",
                  style: textTheme.headlineMedium?.copyWith(
                    color: theme.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      "4.9",
                      style: textTheme.titleLarge?.copyWith(
                        color: theme.secondary,
                      ),
                    ),
                    Icon(Icons.star, color: MaterialTheme.ratingStar.value),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
