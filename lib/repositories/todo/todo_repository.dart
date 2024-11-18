import 'package:todoman/lib.dart';

class TodoRepository {
  final TodoApiClient apiClient;

  TodoRepository({required this.apiClient});

  Future<List<Task>> getTodos() async {
    return await apiClient.fetchTodos();
  }

  Future<void> addTodo(Task todo) async {
    await apiClient.addTodo(todo);
  }

  Future<void> deleteTodo(String id) async {
    await apiClient.deleteTodo(id);
  }

  Future<void> completeTodo(String id) async {
    await apiClient.completeTodo(id);
  }
}
