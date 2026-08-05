import 'package:flutter/material.dart';

/// A widget representing the resulting restaurant after clicking the randomize
/// button. Once clicked, it will take the user to the [restaurant_details] screen.
class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsetsGeometry.all(24.0),
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              //
              constraints: BoxConstraints(maxHeight: 450.0, maxWidth: 400.0),
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Positioned(
                          left: 16,
                          bottom: 16,
                          width: constraints.maxWidth * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Johns's Massive Burger Restfffffffffffffffffffffffffffffffffffffffffffffaurant",
                                style: textTheme.titleLarge?.merge(
                                  TextStyle(color: theme.onPrimary),
                                ),
                                selectionColor: theme.onPrimaryContainer,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              Text("4.5 ★", style: textTheme.bodyMedium),
                            ],
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
