import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_class.dart';

class FavMealsNotifier extends StateNotifier<List<Meal>> {
  FavMealsNotifier() : super([]);

  bool favmealToggle(Meal meal) {
    final isPresent = state.contains(meal);

    if (isPresent) {
      state = state.where((m) => m.id != meal.id).toList();
      return isPresent;
    } else {
      state = state.where((element) => true).toList();
      state.add(meal);
      return isPresent;
    }
  }
}

final favmealsProvider = StateNotifierProvider<FavMealsNotifier, List<Meal>>(
  (ref) {
    return FavMealsNotifier();
  },
);
