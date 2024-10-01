import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

//the convention is to end the class name with 'Notifier'
// never edit values that are managed by the notifier(add, remove,etc.)
//I just got to simply create a new one. This pattern is only enforced because of this package
//'state' property is global and made avaible by this StateNotifier class
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoritesStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // pulling out and keeping all of the existing meals and add them to a new list and I also add the new meal to that list
      state = [...state, meal];
      return true;
    }
  }
}

//StateNotifierProvider is optimized for data that can change
//it works togheter with another class -> StateNotifier
final favoritesProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
