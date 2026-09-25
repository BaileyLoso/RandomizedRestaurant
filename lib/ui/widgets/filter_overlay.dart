import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sweep_steaks/data/repositories/filter_repository.dart';
import 'package:sweep_steaks/ui/widgets/apply_button.dart';
import 'package:sweep_steaks/ui/widgets/filter_search_container.dart';

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
        final theme = ColorScheme.of(context);
        final textTheme = TextTheme.of(context);

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
                        crossAxisAlignment: .center,
                        mainAxisAlignment: .center,
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
                          Text(
                            'Filters',
                            style: textTheme.headlineMedium?.copyWith(
                              color: theme.onSurface,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: .topRight,
                              child: TextButton(
                                onPressed: notifier.clear,
                                child: Text(
                                  'Reset',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: theme.onSurface,
                                    fontWeight: .bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const DividerTheme(
                        data: DividerThemeData(space: 0),
                        child: Divider(),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Stack(
                          children: [
                            const FilterSearchContainer(),
                            Align(
                              alignment: .bottomCenter,
                              child: Padding(
                                padding: const .directional(bottom: 16),
                                child: ApplyButton(onPressed: _hideOverlay),
                              ),
                            ),
                          ],
                        ),
                      ),
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
