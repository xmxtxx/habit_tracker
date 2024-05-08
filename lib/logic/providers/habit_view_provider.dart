import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/logic/providers/config_provider.dart';
import 'package:habit_tracker/view_model/habit_view_model.dart';

mixin HabitViewProvider {
  static final habitViewProvider = Provider<HabitViewModel>((ref) {
    var config = ref.watch(ConfigProvider.configProvider);
    return config.maybeWhen(
        data: (value) =>
            LoadedHabitViewModel(labelPlaceholder: value.placeholder),
        orElse: LoadingHabitViewModel.new);
  });
}
