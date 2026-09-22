import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:randomized_restaurant/ui/view_models/result_view_model.dart';
import 'package:randomized_restaurant/widgets/ratings_bar.dart';
import 'package:randomized_restaurant/widgets/result_photo.dart';

class RestaurantCardView extends ConsumerStatefulWidget {
  const RestaurantCardView({super.key});

  @override
  ConsumerState<RestaurantCardView> createState() => _RestaurantCardViewState();
}

class _RestaurantCardViewState extends ConsumerState<RestaurantCardView> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final randomizerResults = ref.watch(resultViewModelProvider);
    final restaurant = randomizerResults.pickedRestaurant;

    final detailsColor = theme.brightness == Brightness.light
        ? theme.surface
        : theme.onSurface;

    if (randomizerResults.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (restaurant == null) {
      return const Center(child: Text('No restaurants found'));
    }
    ref.read(resultPhotoViewModelProvider.notifier).mainPhoto(debug: true);

    return Column(
      mainAxisAlignment: .start,
      children: [
        Padding(
          padding: .all(24.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(
                  'restaurantDetails',
                  pathParameters: {'id': restaurant.id},
                ),
                child: Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 450.0,
                        maxWidth: 400.0,
                      ),
                      child: ClipRRect(
                        borderRadius: .circular(28),
                        child: AspectRatio(
                          aspectRatio: 8 / 9,
                          child: ResultPhoto(name: restaurant.photo.name),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        crossAxisAlignment: .end,
                        spacing: 16,
                        children: [
                          Padding(
                            // Required padding for GoogleMaps logo
                            padding: const .only(
                              left: 10,
                              right: 10,
                              top: 10,
                              bottom: 5,
                            ),
                            child: SvgPicture.asset(
                              'assets/Google_Maps_Attribution_Assets/GoogleMaps_Logo_White/GoogleMaps_Logo_White.svg',
                              semanticsLabel: 'GoogleMaps attribution image',
                              height: 16,
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: min(
                                MediaQuery.widthOf(context) * 0.6,
                                120,
                              ),
                              child: Padding(
                                padding: const .only(bottom: 5, top: 10),
                                child: FittedBox(
                                  fit: .scaleDown,
                                  alignment: .centerRight,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'More details ',
                                      style: textTheme.bodyLarge?.copyWith(
                                        color: detailsColor,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.arrow_forward,
                                            size: textTheme.bodyLarge?.fontSize,
                                            color: detailsColor,
                                            applyTextScaling: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FittedBox(
                fit: .scaleDown,
                alignment: .topLeft,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: .all(0),
                      child: Text(
                        restaurant.name,
                        style: textTheme.headlineSmall?.copyWith(
                          color: theme.primary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const .only(left: 0),
                      child: RatingsBar(
                        rating: restaurant.rating,
                        reviewCount: restaurant.userRatingCount,
                      ),
                    ),
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
