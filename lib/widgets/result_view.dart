import 'package:flutter/material.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme themeStyle = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsetsGeometry.all(8.0),
      child: GestureDetector(
        child: Container(
          width: 330,
          height: 365,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            gradient: LinearGradient(
              colors: [themeStyle.primaryContainer, themeStyle.primary],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}
