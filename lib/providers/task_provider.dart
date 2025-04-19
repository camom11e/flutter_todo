import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:uuid/uuid.dart'; // Для генерации уникальных ID

class TaskProvider with ChangeNotifier {
  // Список всех задач
  final List<Task> _tasks = [];

  // Получить задачи по статусу
  List<Task> getTasksByStatus(TaskStatus status) {
    return _tasks.where((task) => task.status == status).toList();
  }

  // Добавить новую задачу
  void addTask(String title) {
    final task = Task(
      id: const Uuid().v4(), // Генерируем уникальный ID
      title: title,
      status: TaskStatus.newTask,
    );
    _tasks.add(task);
    notifyListeners(); // Уведомляем интерфейс об изменениях
  }

  // Изменить статус задачи (для перетаскивания)
  void updateTaskStatus(String taskId, TaskStatus newStatus) {
    final task = _tasks.firstWhere((task) => task.id == taskId);
    task.status = newStatus;
    notifyListeners(); // Уведомляем интерфейс об изменениях
  }
}