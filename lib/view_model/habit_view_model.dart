sealed class HabitViewModel {}

class LoadingHabitViewModel extends HabitViewModel {}

class LoadedHabitViewModel extends HabitViewModel {
  final List<String> habits;
  final String labelAddHabit;

  LoadedHabitViewModel({required this.habits, required this.labelAddHabit});
}
