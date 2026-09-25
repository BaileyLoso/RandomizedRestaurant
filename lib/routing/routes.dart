import 'package:go_router/go_router.dart';
import 'package:sweep_steaks/ui/screens/restaurant_details_screen.dart';

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
