import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sweep_steaks/data/repositories/favorites_repository.dart';
import 'package:sweep_steaks/ui/widgets/favorite_button.dart';
import 'package:sweep_steaks/utils/string_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteRestaurantsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) =>
            Center(child: Text('Could not load favorites: $err')),
        data: (restaurants) {
          if (restaurants.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return ListTile(
                onTap: () {
                  if (restaurant.googleMapsUri.isNotEmpty) {
                    launchUrl(
                      Uri.parse(restaurant.googleMapsUri),
                      mode: .externalApplication,
                    );
                  }
                },
                title: Text(restaurant.name),
                subtitle: Text(
                  [
                    restaurant.address,
                    if (restaurant.primaryType.isNotEmpty)
                      restaurant.primaryType
                          .replaceAll('_', ' ')
                          .replaceAll('restaurant', '')
                          .toTitleCase(),
                  ].join(' · '),
                ),
                trailing: FavoriteButton(restaurantId: restaurant.id),
              );
            },
          );
        },
      ),
    );
  }
}
