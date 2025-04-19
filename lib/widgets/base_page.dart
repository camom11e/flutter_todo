import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';

class BasePage extends StatelessWidget {
  final List<Task> tasks;

  const BasePage({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? const Center(child: Text('Нет задач'))
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: tasks[index]);
            },
          );
  }
}