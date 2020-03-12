import 'package:coupleutils/domain/model/TodoListItem.dart';
import 'package:coupleutils/presentation/bloc/TodoListBloc.dart';
import 'package:coupleutils/presentation/widget/todolist/TodoListCheckbox.dart';
import 'package:coupleutils/utils/Dimens.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:coupleutils/utils/Values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppDrawer.dart';

class TodoList extends StatefulWidget {
  final String title;

  TodoList({Key key, this.title}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var todoListBloc = TodoListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: AppDrawer(),
        body: FutureBuilder<List<TodoListItem>>(
            future: todoListBloc.fetchTodoItemsList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? RefreshIndicator(
                      onRefresh: _refreshTodoItemList,
                      child: snapshot.data.isEmpty
                          ? PageView(
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.find_in_page,
                                        size: Dimens.dimens_150,
                                        color: Colors.grey[500]),
                                    Text(Strings.noDataFound)
                                  ],
                                )
                              ],
                            )
                          : ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                final item = snapshot.data[index];
                                return Dismissible(
                                  key: Key(item.idItem),
                                  onDismissed: (direction) {
                                    todoListBloc
                                        .deleteTodoItem(item.idItem)
                                        .then((onValue) {
                                      setState(() {
                                        snapshot.data.removeAt(index);
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text(Strings.itemDeleted
                                                .replaceFirst(
                                                    Strings.itemNamePlaceholder,
                                                    item.nameItem)),
                                            duration: Duration(
                                                milliseconds: Values
                                                    .snackbar_duration_500)));
                                      });
                                    });
                                  },
                                  background: Container(
                                      color: Colors.red,
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsetsDirectional.only(
                                          end: Dimens.dimens_25)),
                                  child: TodoListCheckbox(snapshot.data[index]),
                                );
                              }))
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _buildDialog();
          },
          child: Icon(Icons.add),
        ));
  }

  Future<void> _refreshTodoItemList() async {
    setState(() {});
    return null;
  }

  Future<dynamic> _buildDialog() {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(Strings.addTodoThing),
              content: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(hintText: Strings.todoThing),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text(Strings.cancel),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                FlatButton(
                    child: Text(Strings.validate),
                    onPressed: () {
                      todoListBloc
                          .sendTodoItem(_textFieldController.text)
                          .then((value) {
                        Navigator.of(context).pop();
                        setState(() {
                          _refreshTodoItemList();
                        });
                      }).catchError(print);
                    }),
              ]);
        });
  }
}
