import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sweep_steaks/data/repositories/favorites_repository.dart';

/// A button that adds a restaurant to the user's favorites list
class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key, required this.restaurantId})
    : _shaded = false;

  /// A variant of this button with a translucent dark circular backdrop.
  ///
  /// This is best used on top of photos where contrast may be an issue
  const FavoriteButton.shaded({super.key, required this.restaurantId})
    : _shaded = true;

  final String restaurantId;
  final bool _shaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoriteIdsProvider).value ?? const {};
    final favorited = favoriteIds.contains(restaurantId);

    final button = IconButton(
      onPressed: () {
        final favorites = ref.read(favoritesRepositoryProvider);
        if (favorited) {
          favorites.remove(restaurantId);
        } else {
          favorites.add(restaurantId);
        }
      },
      icon: Icon(favorited ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
    );

    if (!_shaded) {
      return button;
    }

    return Material(
      color: Colors.black.withValues(alpha: 0.4),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: button,
    );
  }
}
