import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/data/repositories/filter_repository.dart';
import 'package:randomized_restaurant/widgets/filter_search_container.dart';

class FilterOverlay extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<FilterOverlay> createState() => _FilterOverlayState();
}

class _FilterOverlayState extends ConsumerState<FilterOverlay> {
  late final OverlayEntry filterOverlay;

  @override
  void initState() {
    super.initState();
    final notifier = ref.watch(filterRepositoryProvider.notifier);
    filterOverlay = OverlayEntry(
      builder: (BuildContext context) {
        return Stack(
          children: [
            ModalBarrier(
              color: Colors.black54,
              dismissible: true,
              onDismiss: _hideOverlay,
            ),
            Center(
              child: SizedBox(
                width: min(MediaQuery.widthOf(context) * 0.9, 400),
                height: min(MediaQuery.heightOf(context) * 0.75, 600),
                child: Material(
                  elevation: 8,
                  borderRadius: .circular(12),
                  clipBehavior: .antiAlias,
                  child: Column(
                    mainAxisSize: .min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: .centerLeft,
                              child: IconButton(
                                onPressed: _hideOverlay,
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                          const Text('Filters'),
                          Expanded(
                            child: Align(
                              alignment: .centerRight,
                              child: TextButton(
                                onPressed: notifier.clear,
                                child: const Text('Reset'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 16),
                      const Expanded(child: FilterSearchContainer()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _buildOverlay() {
    final OverlayState overlayState = Overlay.of(context);
    overlayState.insert(filterOverlay);
  }

  void _hideOverlay() {
    filterOverlay.remove();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => _buildOverlay(),
      child: const Text('Filters'),
    );
  }

  @override
  void dispose() {
    filterOverlay.dispose();
    super.dispose();
  }
}
