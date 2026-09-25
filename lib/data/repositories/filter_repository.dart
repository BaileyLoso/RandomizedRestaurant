import 'package:sweep_steaks/models/categories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_repository.g.dart';

@Riverpod(keepAlive: true)
class FilterRepository extends _$FilterRepository {
  @override
  Set<FoodCategory> build() {
    return {};
  }

  FilterRepository();

  void add(FoodCategory category) => state = {...state, category};

  void clear() => state = {};

  void remove(FoodCategory category) {
    if (state.contains(category)) {
      state = {...state}..remove(category);
    }
  }

  Set<FoodCategory> filters() => state;

  List<FoodCategory> toList() => state.toList();
}
