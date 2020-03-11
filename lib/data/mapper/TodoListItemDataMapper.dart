import 'dart:convert';

import 'package:coupleutils/data/entity/TodoListItemEntity.dart';
import 'package:coupleutils/domain/model/TodoListItem.dart';

List<TodoListItemEntity> parseTodoListItem(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<TodoListItemEntity>((json) => TodoListItemEntity.fromJson(json))
      .toList();
}

class TodoListItemDataMapper {
  List<TodoListItem> transformEntityToModel(
      List<TodoListItemEntity> todoItemListEntity) {
    List<TodoListItem> todoListItem = List();
    todoItemListEntity.forEach((element) {
      todoListItem.add(TodoListItem(
        idItem: element.idItem,
        nameItem: element.nameItem,
        boughtItem: element.boughtItem,
//        doneItem: element.doneItem,
      ));
    });
    return todoListItem;
  }
}
