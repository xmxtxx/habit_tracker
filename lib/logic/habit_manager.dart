import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_tracker/logic/habit_storage.dart';

class HabitManager extends StateNotifier<List<String>> {
  HabitManager() : super([]) {
    _loadHabits();
  }

  Future<void> _loadHabits() async {
    state = await HabitStorage.loadHabits();
  }

  void addHabit(String habit) {
    final updatedHabits = [...state, habit];
    state = updatedHabits;
    HabitStorage.saveHabits(updatedHabits);
  }

  void removeHabit(String habit) {
    final updatedHabits = state.where((h) => h != habit).toList();
    state = updatedHabits;
    HabitStorage.saveHabits(updatedHabits);
  }
}

final habitManagerProvider =
    StateNotifierProvider<HabitManager, List<String>>((ref) => HabitManager());
