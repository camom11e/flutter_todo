import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../widgets/task_card.dart';

class BasePage extends StatelessWidget {
  final String title; // Заголовок страницы
  final List<Task> tasks; // Список задач
  final TaskStatus status; // Статус задач на этой странице
  final Widget? floatingActionButton; // Кнопка для добавления задачи (опционально)

  const BasePage({
    super.key,
    required this.title,
    required this.tasks,
    required this.status,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: DragTarget<Task>(
        onAccept: (task) {
          // Обновляем статус задачи при перетаскивании
          Provider.of<TaskProvider>(context, listen: false)
              .updateTaskStatus(task.id, status);
        },
        builder: (context, candidateData, rejectedData) {
          return tasks.isEmpty
              ? const Center(child: Text('Нет задач'))
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(task: tasks[index]);
                  },
                );
        },
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}