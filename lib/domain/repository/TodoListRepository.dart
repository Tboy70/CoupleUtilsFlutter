import 'package:coupleutils/domain/model/TodoListItem.dart';

abstract class TodoListRepository {
  Future<List<TodoListItem>> getTodoItemList();
}
