enum TaskStatus { newTask, inProgress, completed }

class Task {
  final String id;
  String title;
  TaskStatus status;

  Task({
    required this.id,
    required this.title,
    required this.status,
  });
}