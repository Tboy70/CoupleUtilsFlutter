import 'package:coupleutils/presentation/widget/calendar/RadioButton.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppDrawer.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: AppDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return _buildDialog();
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  Strings.calendarTitle,
                  style: TextStyle(fontSize: 60),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }

  Future<dynamic> _buildDialog() {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(Strings.addEvent),
              content: Column(children: <Widget>[
                RadioButton()]
              ),
              actions: <Widget>[
                FlatButton(
                    child: new Text(Strings.cancel),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                FlatButton(
                    child: new Text(Strings.validate),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                )
              ]);
        });
  }
}
