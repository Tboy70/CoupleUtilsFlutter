import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/TodoListItem.dart';

abstract class TodoListRepository {
  Future<List<TodoListItem>> getTodoItemList();

  Future<ClassicResponse> sendTodoItem(String text);

  Future<bool> deleteTodoItemById(String idItem);

  Future<bool> updateTodoItemById(String idItem);
}
