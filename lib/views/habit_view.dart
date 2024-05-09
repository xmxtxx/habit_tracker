import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/logic/providers/habit_view_provider.dart';
import 'package:habit_tracker/view_model/habit_view_model.dart';

class HabitView extends ConsumerWidget {
  const HabitView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(habitListProvider);

    return switch (viewModel) {
      LoadingHabitViewModel() => const CircularProgressIndicator(),
      LoadedHabitViewModel() => Scaffold(
          appBar: AppBar(title: const Text('Habit Tracker')),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.habits.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(viewModel.habits[index]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      ref.read(habitListProvider.notifier).addHabit(value);
                    }
                  },
                  decoration: InputDecoration(
                    labelText: viewModel.labelPlaceholder,
                    suffixIcon: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ),
    };
  }
}
