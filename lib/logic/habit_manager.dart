import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitManager extends StateNotifier<List<String>> {
  HabitManager() : super([]);

  void addHabit(String habit) {
    state = [...state, habit];
  }

  void removeHabit(String habit) {
    state = state.where((h) => h != habit).toList();
  }
}

final habitManagerProvider =
    StateNotifierProvider<HabitManager, List<String>>((ref) => HabitManager());
