import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:randomized_restaurant/ui/core/theme/theme.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final String? id;

  const RestaurantDetailsScreen({super.key, this.id});

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: double.maxFinite,
              maxHeight: 425,
            ),
            child: Container(color: Colors.blue),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Restaurant Name",
                    style: textStyle.headlineMedium?.copyWith(
                      color: style.primary,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "4.5",
                        style: textStyle.titleSmall?.copyWith(
                          color: style.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.star,
                        color: MaterialTheme.ratingStar.value,
                        size: textStyle.titleSmall?.fontSize,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.directional(top: 8.0),
                    child: Text(
                      "Some flavor text about the restaurant. Maybe cuising, pricing, etc.",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
