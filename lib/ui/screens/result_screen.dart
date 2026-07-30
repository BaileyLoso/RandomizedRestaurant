import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Skeletonizer(
        child: ListView.builder(
          itemBuilder: (context, index) {

            // TODO: Replace Card with actual result 
            return Card(
              child: ListTile(
                title: Text('Item number $index as title'),
                subtitle: const Text('subtitle here'),
                trailing: const Icon(Icons.star),
              ),
            );
          },
          itemCount: 1,
        ),
      ),
    );
  }
}
