import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

void _showRenameDialog(BuildContext context, Task task) {
  final textController = TextEditingController(text: task.title);
  
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Переименовать задачу"),
      content: TextField(
        controller: textController,
        autofocus: true,
        decoration: const InputDecoration(
          labelText: "Новое название",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Отмена"),
        ),
        ElevatedButton(
          onPressed: () {
            final newTitle = textController.text.trim();
            if (newTitle.isNotEmpty) {
              Provider.of<TaskProvider>(context, listen: false)
                .updateTaskTitle(task.id, newTitle);
              Navigator.pop(context);
            }
          },
          child: const Text("Сохранить"),
        ),
      ],
    ),
  );
}




class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:[
          SizedBox(height: 20),
          Text(task.title),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

          ElevatedButton( // Основная кнопка
          onPressed: () {
          Provider.of<TaskProvider>(context, listen: false)
              .moveTaskToBackStatus(task.id);
        },
          child: const Icon(Icons.navigate_before_outlined),
          ),
          ElevatedButton( // Основная кнопка
          onPressed: () => _showRenameDialog(context, task),
          child: const Icon(Icons.drive_file_rename_outline_rounded),
          ),
          
          ElevatedButton( // Основная кнопка
          onPressed: () {
          Provider.of<TaskProvider>(context, listen: false)
              .deleteTask(task.id);
        },
          child: const Icon(Icons.delete),
          ),
          ElevatedButton( // Основная кнопка
          onPressed: () {
          Provider.of<TaskProvider>(context, listen: false)
              .moveTaskToNextStatus(task.id);
        },
          child: const  Icon(Icons.navigate_next_outlined),
    )
            ],
          )

        ],
      ),
    );
  }
}