import 'package:habit_tracker/logic/providers/config_provider.dart';
import 'package:habit_tracker/view_model/habit_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

mixin HabitViewProvider {
  static final habitViewProvider = Provider<HabitViewModel>((ref) {
    var config = ref.watch(ConfigProvider.configProvider);
    return config.maybeWhen(
        data: (value) =>
            LoadedHabitViewModel(labelAddHabit: value.addHabit, habits: []),
        orElse: LoadingHabitViewModel.new);
  });
}
