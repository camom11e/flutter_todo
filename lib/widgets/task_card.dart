import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Draggable<Task>(
      data: task, // Данные, которые передаются при перетаскивании
      feedback: Material(
        // Как выглядит карточка во время перетаскивания
        child: Card(
          child: ListTile(
            title: Text(task.title),
            subtitle: const Text('Перетаскивается...'),
          ),
        ),
      ),
      childWhenDragging: Container(), // Пустое место, когда карточка перетаскивается
      child: Card(
        child: ListTile(
          title: Text(task.title),
        ),
      ),
    );
  }
}