import 'models/Todo.dart';

abstract class TodosApi {
  Stream<List<Todo>> getTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);

  Future<int> clearCompleted();

  Future<int> completeAll({required bool isCompleted});

  Future<void> close();
}

class TodoNotFoundException implements Exception {}