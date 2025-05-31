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
    if (task.status == TaskStatus.newTask) {
      task.status = TaskStatus.inProgress;
    } else if (task.status == TaskStatus.inProgress) {
      task.status = TaskStatus.completed;
    }
    notifyListeners();
  }

  void moveTaskToBackStatus(String taskId) {
    final task = _tasks.firstWhere((task) => task.id == taskId);
    if (task.status == TaskStatus.inProgress) {
      task.status = TaskStatus.newTask;
    } else if (task.status == TaskStatus.completed) {
      task.status = TaskStatus.inProgress;
    }
    notifyListeners();
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((task)=>task.id==taskId);
    notifyListeners();
  }
  void updateTaskTitle(String taskId, String newTitle) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].title = newTitle;
      notifyListeners();
  }
}
}
