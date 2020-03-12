import 'package:coupleutils/data/repository/TodoListRepositoryImpl.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/TodoListItem.dart';
import 'package:coupleutils/domain/repository/TodoListRepository.dart';

class TodoListBloc {
  final TodoListRepository todoListRepository = TodoListRepositoryImpl();

  Future<List<TodoListItem>> fetchTodoItemsList() =>
      todoListRepository.getTodoItemList();

  Future<ClassicResponse> sendTodoItem(String text) =>
      todoListRepository.sendTodoItem(text);

  Future<bool> deleteTodoItem(String idItem) =>
      todoListRepository.deleteTodoItemById(idItem);

  Future<bool> updateTodoItem(String idItem) =>
      todoListRepository.updateTodoItemById(idItem);
}
