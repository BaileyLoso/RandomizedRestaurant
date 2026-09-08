import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/ui/core/theme/theme.dart';
import 'package:randomized_restaurant/ui/view_models/result_view_model.dart';
import 'package:randomized_restaurant/widgets/attributes_dropdown.dart';
import 'package:randomized_restaurant/widgets/hours_dropdown.dart';
import 'package:randomized_restaurant/widgets/result_photo.dart';

import '../../utils/string_helpers.dart';

class RestaurantDetailsScreen extends ConsumerStatefulWidget {
  final String? id;

  const RestaurantDetailsScreen({super.key, this.id});

  @override
  ConsumerState<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState
    extends ConsumerState<RestaurantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    final result = ref.watch(resultViewModelProvider);
    final restaurant = result.pickedRestaurant;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: double.maxFinite,
              maxHeight: MediaQuery.heightOf(context) * 0.4,
            ),
            child: ResultPhoto(name: restaurant!.photo.name),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: textStyle.headlineMedium?.copyWith(
                      color: style.onSurface,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: restaurant.rating.toString(),
                          style: textStyle.titleMedium?.copyWith(
                            color: style.onSurface,
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: MaterialTheme.ratingStar.value,
                                size: (textStyle.titleLarge?.fontSize)! - 3.0,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' · ${restaurant.primaryType.replaceAll('_', ' ').toTitleCase()}',
                              style: textStyle.titleMedium?.copyWith(
                                color: style.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Text(
                    restaurant.summary,
                    style: textStyle.bodyLarge?.copyWith(
                      color: style.onSurface,
                    ),
                  ),
                  Padding(
                    padding: const .only(top: 8.0),
                    child: AttributesDropdown(),
                  ),
                  Padding(
                    padding: const .only(top: 8.0),
                    child: HoursDropdown(),
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
