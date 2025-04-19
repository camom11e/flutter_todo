import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../widgets/task_card.dart';

class InProgressPage extends StatelessWidget {
  const InProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.getTasksByStatus(TaskStatus.inProgress);

    return tasks.isEmpty
        ? const Center(child: Text('Нет задач'))
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) => TaskCard(task: tasks[index]),
          );
  }
}