import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomized_restaurant/data/repositories/filter_repository.dart';
import 'package:randomized_restaurant/models/categories.dart' as categories;
import 'package:randomized_restaurant/widgets/filter_button.dart';

class FilterSearchContainer extends ConsumerStatefulWidget {
  const FilterSearchContainer({super.key});

  @override
  ConsumerState<FilterSearchContainer> createState() =>
      _FilterSearchContainerState();
}

class _FilterSearchContainerState extends ConsumerState<FilterSearchContainer> {
  static final _categories = [...categories.popular, ...categories.all];

  String _query = '';
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(filterRepositoryProvider);
    final matches = _query.isEmpty
        ? _categories
        : _categories
              .where(
                (c) => c.label.toLowerCase().contains(_query.toLowerCase()),
              )
              .toList();

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search categories',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => setState(() => _query = value),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: controller,
            padding: .all(8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...selected
                    .where((c) => matches.contains(c))
                    .map((c) => FilterButton(category: c, key: Key(c.id))),
                ...matches
                    .where((c) => !selected.contains(c))
                    .map((c) => FilterButton(category: c, key: Key(c.id))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
