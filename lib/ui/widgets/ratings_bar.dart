import 'package:flutter/material.dart';
import 'package:sweep_steaks/ui/core/theme/theme.dart';

class RatingsBar extends StatelessWidget {
  const new({
    super.key,
    required this.rating,
    required this.reviewCount,
    this.fontSize,
    this.style,
    this.starColor,
  }) : assert(rating >= 0 && rating <= 5),
       assert(reviewCount >= 0);

  final double rating;
  final int reviewCount;
  final double? fontSize;
  final TextStyle? style;
  final Color? starColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: rating.toString(),
            style: textTheme.titleMedium?.copyWith(
              color: theme.onSurfaceVariant,
            ),

            children: [
              WidgetSpan(
                child: Icon(
                  Icons.star,
                  color: MaterialTheme.ratingStar.value,
                  size: (textTheme.titleLarge?.fontSize)! - 3.0,
                ),
              ),
              TextSpan(text: ' (${reviewCount.toString()})'),
            ],
          ),
        ),
      ],
    );
  }
}
