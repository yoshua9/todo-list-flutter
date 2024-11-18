import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({required this.todoRepository}) : super(const TodoState()) {
    on<FetchTodos>(_onFetchTodos);
    on<AddTodo>(_onAddTodo);
    on<RemoveTodo>(_onRemoveTodo);
    on<CleanStatus>(_onCleanStatus);
    on<CompleteTodo>(_onCompleteTodo);
  }
  Future<void> _onFetchTodos(event, emit) async {
    emit(state.copyWith(status: StatusApp.loading));
    try {
      final allTodos = await todoRepository.getTodos();
      List<Task> todos = [];
      List<Task> completedTodos = [];

      for (Task todo in allTodos) {
        if (todo.status == TaskStatus.completed) {
          completedTodos.add(todo);
        } else if (todo.status == TaskStatus.pending) {
          todos.add(todo);
        }
      }

      emit(state.copyWith(
          todos: todos,
          todosCompleted: completedTodos,
          status: StatusApp.success));
    } catch (_) {
      emit(state.copyWith(status: StatusApp.error));
    }
  }

  void _onAddTodo(event, emit) async {
    emit(state.copyWith(status: StatusApp.loading));

    try {
      await todoRepository.addTodo(event.task);

      final List<Task> todos = <Task>[event.task] + state.todos;
      emit(state.copyWith(
          todos: todos,
          todosCompleted: state.todosCompleted,
          status: StatusApp.initial));
    } catch (_) {
      emit(state.copyWith(status: StatusApp.error));
    }
  }

  void _onCleanStatus(event, emit) async {
    emit(state.copyWith(status: StatusApp.initial));
  }

  void _onRemoveTodo(event, emit) async {
    emit(state.copyWith(status: StatusApp.loading));

    try {
      await todoRepository.deleteTodo(event.id);

      final List<Task> todos = [];
      final List<Task> todosCompleted = [];

      for (Task todo in state.todos) {
        if (todo.id != event.id) {
          todos.add(todo);
        }
      }
      for (Task todo in state.todosCompleted) {
        if (todo.id != event.id) {
          todosCompleted.add(todo);
        }
      }

      emit(state.copyWith(
          todos: todos,
          todosCompleted: todosCompleted,
          status: StatusApp.initial));
    } catch (_) {
      emit(state.copyWith(status: StatusApp.error));
    }
  }

  void _onCompleteTodo(event, emit) async {
    emit(state.copyWith(status: StatusApp.loading));

    try {
      await todoRepository.completeTodo(event.task.id);

      final List<Task> todos = [];
      final List<Task> todosCompleted = <Task>[
            (event.task as Task).copyWith(status: TaskStatus.completed)
          ] +
          state.todosCompleted;

      for (Task todo in state.todos) {
        if (todo.id != event.task.id) {
          todos.add(todo);
        }
      }

      emit(state.copyWith(
          todos: todos,
          todosCompleted: todosCompleted,
          status: StatusApp.initial));
    } catch (_) {
      emit(state.copyWith(status: StatusApp.error));
    }
  }
}
