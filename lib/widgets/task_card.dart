import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Добавляем импорт
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        onTap: () {
          // Меняем статус задачи по клику
          Provider.of<TaskProvider>(context, listen: false)
              .moveTaskToNextStatus(task.id);
        },
      ),
    );
  }
}