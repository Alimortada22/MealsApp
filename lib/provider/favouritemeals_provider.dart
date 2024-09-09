import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouritMealNotifer extends StateNotifier<List<Meal>> {
  FavouritMealNotifer() : super([]);
  bool togglefavouritemeals(Meal meal) {
    final mealfavourite = state.contains(meal);
    if (mealfavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritemealsprovider = StateNotifierProvider<FavouritMealNotifer, List<Meal>>(
    (ref) => FavouritMealNotifer());
