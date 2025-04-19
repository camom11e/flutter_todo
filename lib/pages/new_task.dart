import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../widgets/base_page.dart';

class NewTasksPage extends StatelessWidget {
  const NewTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.getTasksByStatus(TaskStatus.newTask);

    return BasePage(
      title: 'Новые задачи',
      tasks: tasks,
      status: TaskStatus.newTask,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Добавляем задачу с тестовым названием
          taskProvider.addTask('Новая задача ${tasks.length + 1}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}