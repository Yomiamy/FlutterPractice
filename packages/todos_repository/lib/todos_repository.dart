library todos_repository;

export "package:todos_api/TodosApi.dart";
export "src/TodosRepository.dart";

import 'package:todos_api/TodosApi.dart';
import 'package:todos_api/models/Todo.dart';

class TodosRepository {

  final TodosApi _todoosApi;

  const TodosRepository({required TodosApi todosApi}): _todoosApi = todosApi;

  Stream<List<Todo>> getTodos() => _todoosApi.getTodos();

  Future<void> saveTodo(Todo todo) => _todoosApi.saveTodo(todo);

  Future<void> deleteTodo(String id) => _todoosApi.deleteTodo(id);

  Future<int> clearCompleted() => _todoosApi.clearCompleted();

  Future<int> completeAll({required bool isCompleted}) => _todoosApi.completeAll(isCompleted: isCompleted);
}
