import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:randomized_restaurant/ui/core/theme/theme.dart';
import 'package:randomized_restaurant/ui/view_models/result_view_model.dart';
import 'package:randomized_restaurant/ui/widgets/attributes_dropdown.dart';
import 'package:randomized_restaurant/ui/widgets/hours_dropdown.dart';
import 'package:randomized_restaurant/ui/widgets/result_photo.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const .all(8.0),
          child: Material(
            color: Colors.black.withValues(alpha: 0.4),
            shape: const CircleBorder(),
            clipBehavior: .antiAlias,
            child: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: .all(0),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: .maxFinite,
              maxHeight: MediaQuery.heightOf(context) * 0.4,
            ),
            child: Stack(
              children: [
                ResultPhoto(name: restaurant!.photo.name),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Padding(
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
                ),
              ],
            ),
          ),
          Padding(
            padding: .all(8.0),
            child: Align(
              alignment: .centerLeft,
              child: Column(
                spacing: 8,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    restaurant.name,
                    style: textStyle.headlineMedium?.copyWith(
                      color: style.onSurface,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: .center,
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
