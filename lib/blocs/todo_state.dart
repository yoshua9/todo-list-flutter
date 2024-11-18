part of 'todo_bloc.dart';

enum StatusApp { initial, loading, error, success }

class TodoState extends Equatable {
  final List<Task> todos;
  final List<Task> todosCompleted;

  final StatusApp status;

  const TodoState(
      {this.status = StatusApp.initial,
      this.todos = const [],
      this.todosCompleted = const []});

  @override
  List<Object> get props => [todos, todosCompleted, status];

  TodoState copyWith({
    List<Task>? todos,
    List<Task>? todosCompleted,
    StatusApp? status,
  }) =>
      TodoState(
          status: status ?? this.status,
          todos: todos ?? this.todos,
          todosCompleted: todosCompleted ?? this.todosCompleted);
}
