enum Tag { low, medium, high }

enum TaskStatus { pending, deleted, completed }

class Task {
  final String id;
  final String task, description;

  final Tag level;
  final TaskStatus status;

  static Tag getLevelByString(String l) {
    Tag level = Tag.low;
    switch (l) {
      case 'low':
        level = Tag.low;
        break;
      case 'medium':
        level = Tag.medium;

        break;
      case 'high':
        level = Tag.high;

        break;
      default:
    }
    return level;
  }

  static String getLevelByTag(Tag l) {
    String level = 'low';
    switch (l) {
      case Tag.low:
        level = 'low';
        break;
      case Tag.medium:
        level = 'medium';

        break;
      case Tag.high:
        level = 'high';

        break;
      default:
    }
    return level;
  }

  static TaskStatus getStatusByString(String l) {
    TaskStatus level = TaskStatus.pending;
    switch (l) {
      case 'pending':
        level = TaskStatus.pending;
        break;
      case 'completed':
        level = TaskStatus.completed;

        break;
      case 'deleted':
        level = TaskStatus.deleted;

        break;
      default:
    }
    return level;
  }

  static String getStringByStatus(TaskStatus l) {
    String level = 'pending';
    switch (l) {
      case TaskStatus.pending:
        level = 'pending';
        break;
      case TaskStatus.completed:
        level = 'completed';

        break;
      case TaskStatus.deleted:
        level = 'deleted';

        break;
      default:
    }
    return level;
  }

  Task(
      {required this.id,
      required this.task,
      this.description = '',
      this.level = Tag.low,
      this.status = TaskStatus.pending});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        task: json['task'],
        description: json['description'],
        level: getLevelByString(json['level'] ?? 'low'),
        status: getStatusByString(json['status'] ?? 'pending'));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'description': description,
      'level': getLevelByTag(level),
      'status': getStringByStatus(status)
    };
  }

  Task copyWith(
      {String? id,
      String? task,
      String? description,
      Tag? level,
      TaskStatus? status}) {
    return Task(
        id: id ?? this.id,
        task: task ?? this.task,
        description: description ?? this.description,
        level: level ?? this.level,
        status: status ?? this.status);
  }
}
