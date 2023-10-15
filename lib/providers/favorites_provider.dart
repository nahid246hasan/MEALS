import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

final favoriteMeals = Provider((ref) => null);

//jokhon amra dynamic value niye kaj korbo tokhon provider() class diye kaj korte parbo na
//tokhon amader nite hobe StateNotifierProvider()
//StateNotifierProvider() class work together with another class name StateNotifier()

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() :super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      //mealIsFavorite value jodi true hoy tokhon amader oi item remove
      //korte hobe favorite theke
      //ekhane amra m.id!=meal.id check korbo true or false.
      //true hole oi item remove hoye jabe
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else {
      //jokhon value na thakbe tokhon add korte hobe.
      //ei khane amra add korar process dekhbo
      state = [...state, meal];
      return true;
    }
    state = [];
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,
    List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

