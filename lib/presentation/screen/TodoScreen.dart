import 'package:coupleutils/presentation/widget/todolist/TodoList.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TodoList(title: Strings.todoTitle),
    );
  }
}
