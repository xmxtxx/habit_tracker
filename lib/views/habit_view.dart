import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/logic/providers/habit_view_provider.dart';
import 'package:habit_tracker/view_model/habit_view_model.dart';

class HabitView extends ConsumerWidget {
  const HabitView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(HabitViewProvider.habitViewProvider);

    return switch (viewModel) {
      LoadingHabitViewModel() => const CircularProgressIndicator(),
      LoadedHabitViewModel() => const Scaffold(
          body: Center(
            child: Text("Placeholder"),
          ),
        ),
    };
  }
}
