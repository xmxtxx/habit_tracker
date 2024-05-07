import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/view_model/habit_view_model.dart';

mixin HabitViewProvider {
  static final habitViewProvider = Provider<HabitViewModel>((ref) {
    return LoadedHabitViewModel();
  });
}
