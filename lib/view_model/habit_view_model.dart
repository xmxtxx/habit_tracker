sealed class HabitViewModel {}

class LoadingHabitViewModel extends HabitViewModel {}

class LoadedHabitViewModel extends HabitViewModel {
  final List<String> habits;
  final String labelPlaceholder;

  LoadedHabitViewModel({required this.habits, required this.labelPlaceholder});
}
