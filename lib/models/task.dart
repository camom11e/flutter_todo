// Перечисление для статусов задачи
enum TaskStatus { newTask, inProgress, completed }

// Класс задачи
class Task {
  final String id; // Уникальный идентификатор
  final String title; // Название задачи
  TaskStatus status; // Статус задачи

  Task({
    required this.id,
    required this.title,
    required this.status,
  });
}