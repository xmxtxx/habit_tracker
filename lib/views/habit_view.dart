import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/logic/habit_manager.dart';
import 'package:habit_tracker/logic/providers/habit_view_provider.dart';
import 'package:habit_tracker/view_model/habit_view_model.dart';

class HabitView extends ConsumerWidget {
  const HabitView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(HabitViewProvider.habitViewProvider);
    final habits = ref.watch(habitManagerProvider);

    final TextEditingController habitController = TextEditingController();

    Widget body;
    if (viewModel is LoadingHabitViewModel) {
      body = const CircularProgressIndicator();
    } else if (viewModel is LoadedHabitViewModel) {
      body = Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(habits[index]),
              ),
            ),
          ),
          TextField(
            controller: habitController,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                ref.read(habitManagerProvider.notifier).addHabit(value);
                habitController.clear();
              }
            },
            decoration: InputDecoration(
              labelText: viewModel.labelAddHabit,
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (habitController.text.isNotEmpty) {
                    ref
                        .read(habitManagerProvider.notifier)
                        .addHabit(habitController.text);
                    habitController.clear();
                  }
                },
              ),
            ),
          ),
        ],
      );
    } else {
      body = const Text('Unexpected state');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Habit Tracker')),
      body: body,
    );
  }
}
