import 'package:coupleutils/domain/model/TodoListItem.dart';
import 'package:coupleutils/presentation/bloc/TodoListBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListCheckbox extends StatefulWidget {
  TodoListCheckbox(this.todoItem) : super();

  final TodoListItem todoItem;

  @override
  _TodoListCheckboxState createState() => _TodoListCheckboxState();
}

class _TodoListCheckboxState extends State<TodoListCheckbox> {
  var checkedBox = false;
  var lineThrough = false;
  var todoListBloc = TodoListBloc();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(
          widget.todoItem.nameItem,
          style: TextStyle(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
        ),
        value: checkedBox,
        onChanged: (bool value) {});
  }
}
