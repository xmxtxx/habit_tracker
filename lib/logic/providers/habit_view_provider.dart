import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/view_model/habit_view_model.dart';

class HabitListNotifier extends StateNotifier<HabitViewModel> {
  HabitListNotifier() : super(LoadingHabitViewModel()) {
    loadHabits();
  }

  void loadHabits() async {
    await Future.delayed(const Duration(seconds: 2));
    state = LoadedHabitViewModel(
        habits: ['Read', 'Exercise'], labelPlaceholder: 'Add a new habit...');
  }

  void addHabit(String habit) {
    if (state is LoadedHabitViewModel) {
      final currentState = state as LoadedHabitViewModel;
      final updatedHabits = List<String>.from(currentState.habits)..add(habit);
      state = LoadedHabitViewModel(
          habits: updatedHabits,
          labelPlaceholder: currentState.labelPlaceholder);
    }
  }
}

final habitListProvider =
    StateNotifierProvider<HabitListNotifier, HabitViewModel>(
        (ref) => HabitListNotifier());
