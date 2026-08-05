import 'package:flutter/material.dart';
import 'package:randomized_restaurant/widgets/result_view.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Align(alignment: Alignment.topCenter, child: ResultView()),
    );
  }
}
