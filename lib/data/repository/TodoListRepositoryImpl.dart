import 'package:coupleutils/data/api/API.dart';
import 'package:coupleutils/data/mapper/TodoListItemDataMapper.dart';
import 'package:coupleutils/domain/model/ClassicResponse.dart';
import 'package:coupleutils/domain/model/TodoListItem.dart';
import 'package:coupleutils/domain/repository/TodoListRepository.dart';

class TodoListRepositoryImpl extends TodoListRepository {
  final api = API();

  TodoListItemDataMapper todoListItemDataMapper = TodoListItemDataMapper();

  @override
  Future<List<TodoListItem>> getTodoItemList() {
    return api.fetchTodoItemsList().then((onValue) {
      return todoListItemDataMapper.transformEntityToModel(onValue);
    });
  }

  @override
  Future<ClassicResponse> sendTodoItem(String text) => api.sendTodoItem(text);

  @override
  Future<bool> deleteTodoItemById(String idItem) =>
      api.deleteTodoItemById(idItem);

  @override
  Future<bool> updateTodoItemById(String idItem) =>
      api.updateTodoItemById(idItem);
}
