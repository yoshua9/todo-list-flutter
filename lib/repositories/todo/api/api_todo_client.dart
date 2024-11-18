import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoman/lib.dart';

class TodoApiClient {
  final http.Client httpClient;

  TodoApiClient({required this.httpClient});

  Future<List<Task>> fetchTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> todos = prefs.getStringList('todos') ?? [];

    return todos.map<Task>((e) => Task.fromJson(jsonDecode(e))).toList();
  }

  Future<void> addTodo(Task todo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todos = prefs.getStringList('todos') ?? [];
    todos = [jsonEncode(todo.toJson())] + todos;

    prefs.setStringList('todos', todos);
  }

  Future<void> deleteTodo(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todos = prefs.getStringList('todos') ?? [];

    List<String> todosUpdate = [];

    for (String todo in todos) {
      final Task task = Task.fromJson(jsonDecode(todo));
      if (task.id != id) {
        todosUpdate.add(todo);
      }
    }

    prefs.setStringList('todos', todosUpdate);
  }

  Future<void> completeTodo(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todos = prefs.getStringList('todos') ?? [];

    List<String> todosUpdate = [];

    for (String todo in todos) {
      final Task task = Task.fromJson(jsonDecode(todo));
      if (task.id == id) {
        todosUpdate.add(
            jsonEncode(task.copyWith(status: TaskStatus.completed).toJson()));
      } else {
        todosUpdate.add(todo);
      }
    }

    prefs.setStringList('todos', todosUpdate);
  }
}
