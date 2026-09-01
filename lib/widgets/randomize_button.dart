import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:randomized_restaurant/ui/view_models/result_view_model.dart';

class RandomizeButton extends ConsumerWidget {
  const RandomizeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final ButtonStyle style = ButtonStyle(
      backgroundColor: WidgetStateProperty.fromMap(
        <WidgetStatesConstraint, Color>{
          WidgetState.focused | WidgetState.pressed: theme.tertiary,
          WidgetState.disabled: theme.secondaryContainer,
          WidgetState.any: theme.tertiaryContainer,
        },
      ),
      shape: WidgetStateProperty.fromMap(
        <WidgetStatesConstraint, OutlinedBorder>{
          WidgetState.any: CircleBorder(),
        },
      ),
    );

    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child: ElevatedButton(
            style: style,
            onPressed: () async {
              var serviceEnabled = await Geolocator.isLocationServiceEnabled();
              if (!serviceEnabled) {
                return Future.error('Location services disabled');
              }

              var permission = await Geolocator.checkPermission();
              if (permission == LocationPermission.denied) {
                permission = await Geolocator.requestPermission();
                if (permission == LocationPermission.denied ||
                    permission == LocationPermission.deniedForever) {
                  return Future.error('Location permissions are denied');
                }
              }

              Position coords = await Geolocator.getCurrentPosition();
              await ref
                  .read(resultViewModelProvider.notifier)
                  .load(latitude: coords.latitude, longitude: coords.longitude);
              if (context.mounted) {
                context.pushNamed('result');
              }
            },
            child: Center(
              child: Text(
                'Feed Me Something',
                style: textTheme.headlineLarge?.copyWith(
                  color: theme.onTertiaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
