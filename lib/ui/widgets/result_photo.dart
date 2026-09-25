import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sweep_steaks/data/repositories/photo_repository.dart';

class ResultPhoto extends ConsumerStatefulWidget {
  final String name;
  const new({super.key, required this.name});

  @override
  ConsumerState<ResultPhoto> createState() => _ResultPhotoState();
}

class _ResultPhotoState extends ConsumerState<ResultPhoto> {
  @override
  Widget build(BuildContext context) {
    var photoMap = ref.watch(photoRepositoryProvider);
    var entry = photoMap[widget.name];
    return switch (entry) {
      PhotoCacheEntry(photo: _, accessTime: _) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(entry.photo.uri),
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black],
            begin: AlignmentGeometry.center,
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
      ),
      null => SizedBox.expand(child: Container()),
    };
  }
}
