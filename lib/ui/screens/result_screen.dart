import 'package:flutter/material.dart';
import 'package:randomized_restaurant/widgets/result_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ResultView();
          },
          itemCount: 1,
        ),
      ),
    );
  }
}
