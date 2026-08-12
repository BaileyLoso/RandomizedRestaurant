import 'package:go_router/go_router.dart';
import 'package:randomized_restaurant/ui/screens/restaurant_details_screen.dart';

///TODO Navigation routing
/// Navigation paths not named in the navigation bar
class Routes {
  final List<GoRoute> routes = [
    GoRoute(
      name: 'restaurantDetails',
      path: '/restaurant_details/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return RestaurantDetailsScreen(id: id);
      },
    ),
  ];
}
