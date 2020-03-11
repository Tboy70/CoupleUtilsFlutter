import 'package:coupleutils/data/repository/TodoListRepositoryImpl.dart';
import 'package:coupleutils/domain/model/TodoListItem.dart';
import 'package:coupleutils/domain/repository/TodoListRepository.dart';

class TodoListBloc {
  final TodoListRepository todoListRepository = TodoListRepositoryImpl();

  Future<List<TodoListItem>> fetchTodoItemsList() =>
      todoListRepository.getTodoItemList();
}
