import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

//ei provider() use kora hoy static value er jonno
//like dummyMeals ekti static list
final mealsProvider= Provider((ref) {
  return dummyMeals;
});