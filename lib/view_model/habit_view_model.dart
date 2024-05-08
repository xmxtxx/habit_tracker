sealed class HabitViewModel {}

class LoadingHabitViewModel extends HabitViewModel {}

class LoadedHabitViewModel extends HabitViewModel {
  String labelPlaceholder;

  LoadedHabitViewModel({required this.labelPlaceholder});
}
