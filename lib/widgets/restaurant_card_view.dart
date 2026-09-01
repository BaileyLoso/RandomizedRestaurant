import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:randomized_restaurant/ui/core/theme/theme.dart';
import 'package:randomized_restaurant/ui/view_models/result_view_model.dart';

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

    if (randomizerResults.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (restaurant == null) {
      return const Center(child: Text("No restaurants found"));
    }
    final photo = ref.watch(resultPhotoViewModelProvider.notifier).mainPhoto();

    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(24.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(
                  "restaurantDetails",
                  pathParameters: {'id': restaurant.id},
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
                        child: Image.network(
                          'https://spotpetinsurance.ca/_next/image?url=https:%2F%2Fimages.ctfassets.net%2Fm5ehn3s5t7ec%2Fwp-image-197581%2Fa5246e00944982b564d4c610c56577f1%2FHouse-Cat-Breeds.jpg&w=1200&q=75',
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height,
                        ),
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
                  restaurant.name,
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
                      restaurant.rating.toString(),
                      style: textTheme.titleLarge?.copyWith(
                        color: theme.secondary,
                      ),
                    ),
                    Icon(Icons.star, color: MaterialTheme.ratingStar.value),
                    Text('(${restaurant.userRatingCount})'),
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
