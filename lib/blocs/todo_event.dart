part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class FetchTodos extends TodoEvent {}

final class CleanStatus extends TodoEvent {}

final class AddTodo extends TodoEvent {
  final Task task;

  const AddTodo(this.task);

  @override
  List<Object> get props => [task];
}

final class CompleteTodo extends TodoEvent {
  final Task task;

  const CompleteTodo(this.task);

  @override
  List<Object> get props => [task];
}

final class RemoveTodo extends TodoEvent {
  final String id;

  const RemoveTodo(this.id);

  @override
  List<Object> get props => [id];
}
