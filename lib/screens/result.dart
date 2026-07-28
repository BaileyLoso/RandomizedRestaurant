import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:randomized_restaurant/widgets/app_nav_bar.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        ),
      bottomNavigationBar: AppNavBar(indexValue: 0,),
    );
  }
}

