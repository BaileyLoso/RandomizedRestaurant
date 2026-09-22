import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/data/repositories/photo_repository.dart';

class ResultPhoto extends ConsumerStatefulWidget {
  final String name;
  const new({super.key, required this.name});

  @override
  ConsumerState<ResultPhoto> createState() => _ResultPhotoState();
}

class _ResultPhotoState extends ConsumerState<ResultPhoto> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

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
            colors: [Colors.transparent, theme.onSurface],
            begin: AlignmentGeometry.center,
            end: AlignmentGeometry.bottomCenter,
          ),
          backgroundBlendMode: BlendMode.xor,
        ),
      ),
      null => SizedBox.expand(child: Container()),
    };
  }
}
