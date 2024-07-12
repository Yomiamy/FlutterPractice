library local_storage_todos_api;

import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_api/TodosApi.dart';
import 'package:todos_api/models/Todo.dart';

class LocalStorageTodosApi implements TodosApi {
  final SharedPreferences _plugin;

  LocalStorageTodosApi({required SharedPreferences plugin}) : _plugin = plugin;

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) => _plugin.setString(key, value);

  late final BehaviorSubject<List<Todo>> _todoStreamController = BehaviorSubject<List<Todo>>.seeded(
    const [],
  );

  @visibleForTesting
  static const kTodosCollectionKey = '__todos_collection_key__';

  void _init() {
    final todoJson = _getValue(kTodosCollectionKey);

    if(todoJson != null) {
      final List<Todo> todos = List<Map<dynamic, dynamic>>.from(
        json.decode(todoJson) as List
      ).map((jsonMap) => Todo.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _todoStreamController.add(todos);
    } else {
      _todoStreamController.add(const []);
    }
  }

  @override
  Stream<List<Todo>> getTodos() => _todoStreamController.asBroadcastStream();

  @override
  Future<void> saveTodo(Todo todo) {
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.id == todo.id);

    if(todoIndex >= 0) {
      todos[todoIndex] = todo;
    } else {
      todos.add(todo);
    }

    _todoStreamController.add(todos);
    return _setValue(kTodosCollectionKey, json.encode(todos));
  }

  @override
  Future<void> deleteTodo(String id) {
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.id == id);
    
    if(todoIndex == -1) {
      throw TodoNotFoundException();
    } else {
      todos.removeAt(todoIndex);
      _todoStreamController.add(todos);
      return _setValue(kTodosCollectionKey, json.encode(todos));
    }
  }

  @override
  Future<int> clearCompleted() async {
    final todos = [..._todoStreamController.value];
    final completedTodosAmount = todos.where((t) => t.isCompleted).length;
    todos.removeWhere((t) => t.isCompleted);

    _todoStreamController.add(todos);
    await _setValue(kTodosCollectionKey, json.encode(todos));

    return completedTodosAmount;
  }

  @override
  Future<void> close() {
    return _todoStreamController.close();
  }

  @override
  Future<int> completeAll({required bool isCompleted}) async {
    final todos = [..._todoStreamController.value];
    final changedTodosAmount = todos.where((t) => t.isCompleted != isCompleted).length;
    final newTodos = [
      for(Todo todo in todos) todo.copyWith(isCompleted: isCompleted)
    ];

    _todoStreamController.add(newTodos);

    await _setValue(kTodosCollectionKey, json.encode(newTodos));
    return changedTodosAmount;
  }
}
