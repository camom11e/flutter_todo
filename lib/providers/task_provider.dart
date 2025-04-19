import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:uuid/uuid.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> getTasksByStatus(TaskStatus status) {
    return _tasks.where((task) => task.status == status).toList();
  }

  void addTask(String title) {
    final task = Task(
      id: const Uuid().v4(),
      title: title,
      status: TaskStatus.newTask,
    );
    _tasks.add(task);
    notifyListeners();
  }

  void moveTaskToNextStatus(String taskId) {
    final task = _tasks.firstWhere((task) => task.id == taskId);
    // Меняем статус на следующий
    if (task.status == TaskStatus.newTask) {
      task.status = TaskStatus.inProgress;
    } else if (task.status == TaskStatus.inProgress) {
      task.status = TaskStatus.completed;
    }
    // Если задача уже завершена, ничего не делаем
    notifyListeners();
  }
}